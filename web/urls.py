# -*- coding: utf-8 -*-
# !/usr/bin/env python
"""Django Routing."""
from django.conf.urls import url
from django.contrib import admin
from web.core import views as views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', views.index),
]
