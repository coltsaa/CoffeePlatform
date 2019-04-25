# !/usr/bin/env python
# -*- coding:utf-8 -*-
# @Author  : EiJi
# @Email   : ostantares@gmail.com
from django.conf.urls import url
from order.views import OrderPlaceView, OrderCommitView, OrderCheckView, OrderPayView, CommentView

urlpatterns = [
    url(r'^place$', OrderPlaceView.as_view(), name='place'), 
    url(r'^commit$', OrderCommitView.as_view(), name='commit'), 
    url(r'^pay$', OrderPayView.as_view(), name='pay'),
    url(r'^check$', OrderCheckView.as_view(), name='check'), 
    url(r'^comment/(?P<order_id>.*)$', CommentView.as_view(), name='comment'), 
]
