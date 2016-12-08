# -*- coding: utf-8 -*-
from django.conf.urls import url
from django.contrib import admin
from web.core import views as views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', views.index),
    url(r'^about/$', views.about),
    url(r'^manage/$', views.manage),
    url(r'^analyse/$', views.analyse),
    url(r'^predict/$', views.predict),
]
