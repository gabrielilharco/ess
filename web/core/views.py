# -*- coding: utf-8 -*-
"""Views controller."""
from django.shortcuts import render, render_to_response
from django.template import RequestContext
from data.reader import load_database
from data.answers import QA
from web.core.models import Survey
from data.analysis import frequency_counter


def index(request):
    """Index page."""
    return render_to_response(
        'index.html', context_instance=RequestContext(request))


def manage(request):
    """Manage page."""
    if request.method == 'POST':
        countries = {'ESS7PT.dta': request.POST.get('Portugal') == "on",
                     'ESS7IL.dta': request.POST.get('Israel') == "on",
                     'ESS7GB.dta': request.POST.get('Great Britain') == "on"
                     }
        load_database(countries)
        return render(request, 'manage.html', {'loaded': True})

    return render_to_response(
        'manage.html', context_instance=RequestContext(request))


def analyse(request):
    """Analysis page."""
    if request.method == 'POST':
        q = request.POST.get("question", "")
        print(q)
        return render(request, 'analyse.html', {'analysis': frequency_counter(q), 'data': QA})

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
