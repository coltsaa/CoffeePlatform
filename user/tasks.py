"""please input file function"""
# !/usr/bin/env python
# -*- coding:utf-8 -*-
# @Author  : EiJi
# @Email   : ostantares@gmail.com


from celery import task
from django.conf import settings
from django.core.mail import send_mail

@task
def send_register_active_email(to_email, username, token):
    subject = '坂cafe欢迎信息'
    message = ''
    sender = settings.EMAIL_FROM
    receiver = [to_email]
    html_message = """
                            <h1>%s, 欢迎您成为坂cafe注册会员</h1>
                            请点击以下链接激活您的账户<br/>
                            <a href="http://127.0.0.1:8000/user/active/%s">http://127.0.0.1:8000/user/active/%s</a>
                        """ % (username, token, token)
    send_mail(subject, message, sender, receiver, html_message=html_message)