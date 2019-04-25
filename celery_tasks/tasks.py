# !/usr/bin/env python
# -*- coding:utf-8 -*-
# @Author  : EiJi
# @Email   : ostantares@gmail.com
from django.conf import settings
from django.core.mail import send_mail
from django.template import loader
from django.shortcuts import render
import os
import sys
sys.path.insert(0, './')
import django
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "sakacafe.settings")
django.setup()
from goods.models import GoodsType, IndexGoodsBanner, IndexPromotionBanner, IndexTypeGoodsBanner
from celery_tasks.celery import app as app

@app.task
def send_register_active_email(to_email, username, token):
    subject = '坂cafe欢迎信息'
    message = ''
    sender = settings.EMAIL_FROM
    receiver = [to_email]
    html_message = """
                        <h1>%s, 欢迎您成为坂cafe注册会员</h1>
                        请点击以下链接激活您的账户(7个小时内有效)<br/>
                        <a href="http://127.0.0.1:8000/user/active/%s">http://127.0.0.1:8000/user/active/%s</a>
                    """ % (username, token, token)
    send_mail(subject, message, sender, receiver, html_message=html_message)

@app.task
def generate_static_index_html():
    types = GoodsType.objects.all()
    index_banner = IndexGoodsBanner.objects.all().order_by('index')
    promotion_banner = IndexPromotionBanner.objects.all().order_by('index')
    for category in types:
        image_banner = IndexTypeGoodsBanner.objects.filter(category=category, display_type=1)
        title_banner = IndexTypeGoodsBanner.objects.filter(category=category, display_type=0)
        category.title_banner = title_banner
        category.image_banner = image_banner
    cart_count = 0
    context = {
        'types': types,
        'index_banner': index_banner,
        'promotion_banner': promotion_banner,
        'cart_count': cart_count,
    }

    from django.template import loader
    temp = loader.get_template('static_index.html')
    static_html = temp.render(context)
    save_path = os.path.join(settings.BASE_DIR, 'static/index.html')
    with open(save_path, 'w') as f:
        f.write(static_html)







