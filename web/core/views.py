# -*- coding: utf-8 -*-
"""Views controller."""
from django.shortcuts import render, render_to_response
from django.template import RequestContext
from data.reader import load_database
from data.answers import QA
from web.core.models import Survey
from data.analysis import frequency_counter
from data.analysis import frequency_by_country

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
    """Analysis page."""
    if request.method == 'POST':
        q = request.POST.get("question", "")
        t = request.POST.get("type", "")
        print(q)
        print(t)
        if t == 'piechart':
            return render(request, 'analyse.html', {'analysis': frequency_counter(q), 'data': QA})
        elif t == 'treemap':
            return render(request, 'analyse.html', {'analysis': frequency_by_country(q), 'data': QA})
        else:
            return render(request, 'analyse.html', {'analysis': { 'error': True }, 'data': QA})

    return render(request, 'analyse.html', {'analysis': {}, 'data': QA})


def predict(request):
    """Prediction page"""
    algorithms = {
        1: 'Support Vector Machine',
        2: 'Decition Trees',
        3: 'Gaussian Naive Bayes',
        4: 'Nearest Neighbors'
    }

    return render(request, 'predict.html', {'data': QA, 'algorithms': algorithms})
