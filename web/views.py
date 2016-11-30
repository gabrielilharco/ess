# -*- coding: utf-8 -*-
# !/usr/bin/env python
"""Django Views."""
from django.shortcuts import render_to_response


def index(request):
    """Return index page."""
    return render_to_response('index.html')
