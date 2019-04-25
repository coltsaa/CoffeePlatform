# !/usr/bin/env python
# -*- coding:utf-8 -*-
# @Author  : EiJi
# @Email   : ostantares@gmail.com
from django.conf.urls import url
from cart.views import CartAddView, CartInfoView, CartUpdateView, CartDeleteView

urlpatterns = [
    url(r'^add$', CartAddView.as_view(), name='add'), 
    url(r'^$', CartInfoView.as_view(), name='show'), 
    url(r'^update$', CartUpdateView.as_view(), name='update'), 
    url(r'^delete$', CartDeleteView.as_view(), name='delete'), 
]
