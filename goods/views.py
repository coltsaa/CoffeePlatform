from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.core.cache import cache
from django.core.urlresolvers import reverse
from django.views.generic import View
from django_redis import get_redis_connection
from goods.models import GoodsType, IndexGoodsBanner, IndexPromotionBanner, IndexTypeGoodsBanner, GoodsSKU
from order.models import OrderGoods

class IndexView(View):
    def get(self, request):
        context = cache.get('index_page_data') 
        if context is None:
            print('设置首页缓存')
            types = GoodsType.objects.all()
            index_banner = IndexGoodsBanner.objects.all().order_by('index')
            promotion_banner = IndexPromotionBanner.objects.all().order_by('index')
            for category in types:
                image_banner = IndexTypeGoodsBanner.objects.filter(category=category, display_type=1)
                title_banner = IndexTypeGoodsBanner.objects.filter(category=category, display_type=0)
                category.title_banner = title_banner
                category.image_banner = image_banner
            context = {
                'types': types,
                'index_banner': index_banner,
                'promotion_banner': promotion_banner,
                'cart_count': 0
            }
            cache.set('index_page_data', context, 3600)
        cart_count = 0
        if request.user.is_authenticated():
            conn = get_redis_connection('default')
            print(request.user.id)
            cart_key = 'cart_%s' % request.user.id
            cart_count = conn.hlen(cart_key)
        context.update(cart_count=cart_count)
        return render(request, 'index.html', context) 

class DetailView(View):
    def get(self, request, sku_id):
        try:
            sku = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            return redirect(reverse('goods:index'))
        types = GoodsType.objects.all()
        order_skus = OrderGoods.objects.filter(sku=sku).exclude(comment='').order_by('-update_time')
        same_spu_skus = GoodsSKU.objects.filter(goods=sku.goods).exclude(id=sku_id)
        new_skus = GoodsSKU.objects.filter(category=sku.category).order_by('-create_time')[:2]
        cart_count = 0
        if request.user.is_authenticated():
            conn = get_redis_connection('default')
            cart_key = 'cart_%s' % request.user.id
            cart_count = conn.hlen(cart_key)
            history_key = 'history_%d' % request.user.id
            conn.lrem(history_key, 0, sku_id)
            conn.lpush(history_key, sku_id)
            conn.ltrim(history_key, 0, 4)
        context = {
            'sku': sku,
            'types': types,
            'order_skus': order_skus,
            'same_spu_skus': same_spu_skus,
            'new_skus': new_skus,
            'cart_count': cart_count
        }
        return render(request, 'detail.html', context)

class ListView(View):
    def get(self, request, type_id, page):
        try:
            category = GoodsType.objects.get(id=type_id)
        except GoodsType.DoesNotExist:
            return redirect(reverse('goods:index'))
        types = GoodsType.objects.all()
        sort = request.GET.get('sort')
        if sort == 'price':
            skus = GoodsSKU.objects.filter(category=category).order_by('price')
        elif sort == 'hot':
            skus = GoodsSKU.objects.filter(category=category).order_by('-sales')
        else:
            sort = 'default'
            skus = GoodsSKU.objects.filter(category=category).order_by('-id')
        from django.core.paginator import Paginator
        paginator = Paginator(skus, 5)
        page = int(page)
        if page > paginator.num_pages:
            page = 1
        skus_page = paginator.page(page)
        num_pages = paginator.num_pages
        if num_pages < 5:
            pages = range(1, num_pages + 1)
        elif page <= 3:
            pages = range(1, 6)
        elif num_pages - page <= 2:
            pages = range(num_pages - 4, num_pages + 1)
        else:
            pages = range(page - 2, page + 3)
        new_skus = GoodsSKU.objects.filter(category=category).order_by('-create_time')[:2]
        cart_count = 0
        if request.user.is_authenticated():
            conn = get_redis_connection('default')
            cart_key = 'cart_%s' % request.user.id
            cart_count = conn.hlen(cart_key)
        context = {
            'type': category,
            'types': types,
            'skus_page': skus_page,
            'new_skus': new_skus,
            'cart_count': cart_count,
            'sort': sort,
            'pages': pages
        }
        return render(request, 'list.html', context)



