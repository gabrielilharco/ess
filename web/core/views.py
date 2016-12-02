# -*- coding: utf-8 -*-
"""Views controller."""
from django.shortcuts import render, render_to_response
from django.template import RequestContext
from data.reader import load_database


def index(request):
    """Index page."""
    return render_to_response(
        'index.html', context_instance=RequestContext(request))


def manage(request):
    """Manage page."""
    if request.method == 'POST':
        load_database()
        return render(request, 'manage.html', {'loaded': True})

    return render_to_response(
        'manage.html', context_instance=RequestContext(request))


def analyse(request):
    """Manage page."""
    return render_to_response(
        'index.html', context_instance=RequestContext(request))
