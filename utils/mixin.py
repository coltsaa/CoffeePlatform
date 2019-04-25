# !/usr/bin/env python
# -*- coding:utf-8 -*-
# @Author  : EiJi
# @Email   : ostantares@gmail.com
from django.views.generic import View
from django.contrib.auth.decorators import login_required


class LoginRequiredView(View):
    @classmethod
    def as_view(cls, **initkwargs):
        view = super().as_view(**initkwargs)
        return login_required(view)


class LoginRequiredMixin(object):
    @classmethod
    def as_view(cls, **initkwargs):
        view = super(LoginRequiredMixin,cls).as_view(**initkwargs)
        return login_required(view)
