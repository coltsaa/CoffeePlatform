import re
from django.shortcuts import render, redirect
from django.core.urlresolvers import reverse
# from django.core.mail import send_mail
from django.views.generic import View
from django.conf import settings
from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from itsdangerous import SignatureExpired
from user.models import User, Address
from goods.models import GoodsSKU
from order.models import OrderInfo, OrderGoods
from celery_tasks import tasks
from utils.mixin import LoginRequiredView, LoginRequiredMixin
from django_redis import get_redis_connection

class RegisterView(View):
    def get(self, request):
        return render(request, 'register.html')

    def post(self, request):
        username = request.POST.get('user_name') 
        password = request.POST.get('pwd')
        email = request.POST.get('email')
        if not all([username, password, email]):
            return render(request, 'register.html', {'errmsg': '数据不完整'})
        if not re.match(r'^[a-z0-9][\w.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$', email):
            return render(request, 'register.html', {'errmsg': '邮箱格式不正确'})
        try:
            user = User.objects.get(username=username)
        except User.DoesNotExist:
            user = None
        if user is not None:
            return render(request, 'register.html', {'errmsg': '用户名已注册'})
        user = User.objects.create_user(username, email, password)
        user.is_active = 0
        user.save()
        serializer = Serializer(settings.SECRET_KEY, 3600 * 7)
        info = {'confirm': user.id}
        token = serializer.dumps(info)
        token = token.decode()
        tasks.send_register_active_email.delay(email, username, token)
        return redirect(reverse('goods:index'))

class ActiveView(View):
    def get(self, request, token):
        serializer = Serializer(settings.SECRET_KEY, 3600 * 7)
        try:
            info = serializer.loads(token)
            user_id = info['confirm']
            user = User.objects.get(id=user_id)
            user.is_active = 1
            user.save()
            return redirect(reverse('user:login'))
        except SignatureExpired as e:
            return HttpResponse('激活链接已失效')

class LoginView(View):
    def get(self, request):
        username = request.COOKIES.get('username')
        checked = 'checked'
        if username is None:
            username = ''
            checked = ''
        return render(request, 'login.html', {'username': username, 'checked': checked})

    def post(self, request):
        username = request.POST.get('username')
        password = request.POST.get('pwd')
        remember = request.POST.get('remember')
        if not all([username, password]):
            return render(request, 'login.html', {'errmsg': '参数不完整'})
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                next_url = request.GET.get('next', reverse('goods:index'))
                response = redirect(next_url) 
                if remember == 'on':
                    response.set_cookie('username', username, max_age=7 * 24 * 3600)
                else:
                    response.delete_cookie('username')
                return response
            else:
                return render(request, 'login.html', {'errmsg': '用户未激活'})
        else:
            return render(request, 'login.html', {'errmsg': '用户名或密码错误'})

class LogoutView(View):
    def get(self, request):
        logout(request)
        return redirect(reverse('user:login'))

class UserInfoView(LoginRequiredMixin, View):
    def get(self, request):
        user = request.user
        address = Address.objects.get_default_address(user)
        conn = get_redis_connection('default')
        history_key = 'history_%d' % user.id
        sku_ids = conn.lrange(history_key, 0, 4)
        skus = []
        for sku_id in sku_ids:
            sku = GoodsSKU.objects.get(id=sku_id)
            skus.append(sku)
        context = {
            'address': address,
            'skus': skus,
            'page': 'user'
        }
        return render(request, 'user_center_info.html', context)

class UserOrderView(LoginRequiredMixin, View):
    def get(self, request, page):
        user = request.user
        info_msg = 1   
        try:
            order_infos = OrderInfo.objects.filter(user=user).order_by('-create_time')
        except OrderInfo.DoesNotExist :
            info_msg = 0
        if len(order_infos) == 0:
            info_msg = 0
        context = {
            'page': 'order',
            'info_msg': info_msg,
        }
        if info_msg == 1:
            for order_info in order_infos:
                order_goods = OrderGoods.objects.filter(order=order_info)
                for order_good in order_goods:
                    amount = order_good.price * order_good.count
                    order_good.amount = amount
                order_info.order_goods = order_goods
                order_info.status_title = OrderInfo.ORDER_STATUS[order_info.order_status]
            from django.core.paginator import Paginator
            paginator = Paginator(order_infos, 3)
            page = int(page)
            if page > paginator.num_pages:
                page = 1
            order_infos_page = paginator.page(page)
            num_pages = paginator.num_pages
            if num_pages < 5:
                pages = range(1, num_pages + 1)
            elif page <= 3:
                pages = range(1, 6)
            elif num_pages - page <= 2:
                pages = range(num_pages - 4, num_pages + 1)
            else:
                pages = range(page - 2, page + 3)
            context = {
                'page': 'order',
                'order_infos': order_infos,
                'info_msg': info_msg,
                'pages' : pages,
                'order_infos_page': order_infos_page
            }
        return render(request, 'user_center_order.html', context)

class AddressView(LoginRequiredMixin, View):
    def get(self, request):
        user = request.user
        default_address = Address.objects.get_default_address(user)
        all_address = Address.objects.get_all_address(user)
        context = {
            'address': default_address,
            'have_address': all_address,
            'page': 'address'
        }
        return render(request, 'user_center_site.html', context)

    def post(self, request):
        receiver = request.POST.get('receiver')
        addr = request.POST.get('direction')
        phone = request.POST.get('phone_number')
        if not all([receiver, addr, phone]):
            return render(request, 'user_center_site.html', {'errmsg': '数据不完整'})
        user = request.user
        address = Address.objects.get_default_address(user)
        is_default = True
        if address is not None:
            is_default = False
        Address.objects.create(user=user,
                               receiver=receiver,
                               addr=addr,
                               phone=phone,
                               is_default=is_default)
        return redirect(reverse('user:address'))

