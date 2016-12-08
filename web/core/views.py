# -*- coding: utf-8 -*-
"""Views controller."""
from django.shortcuts import render, render_to_response
from django.template import RequestContext
from data.reader import load_database
from data.answers import QA
from web.core.models import Survey
from data.analysis import frequency_counter, frequency_by_country, get_statistics, getCategories
from django.utils.safestring import mark_safe

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
        t = request.POST.get("type", "")
        if t == 'piechart':
            return render(request, 'analyse.html', {'analysis': frequency_counter(q), 'data': QA, 'p': True, 'question':q})
        elif t == 'treemap':
            return render(request, 'analyse.html', {'analysis': frequency_by_country(q), 'data': QA, 'p': True, 'question':q, 'treemap': True})
        else:
            return render(request, 'analyse.html', {'analysis': {'error': True}, 'data': QA, 'p': True, 'question':q})

    return render(request, 'analyse.html', {'analysis': {}, 'data': QA, 'p': False})


def predict(request):
    """Prediction page"""
    algorithms = {
        1: 'Support Vector Machine',
        2: 'Decision Trees',
        3: 'Gaussian Naive Bayes',
        4: 'Nearest Neighbors'
    }
    if request.method == 'POST':
        question = request.POST.get("question", "")
        algorithm = int(request.POST.get("algorithm", "1"))
        cm, acc = get_statistics(question, algorithm)
        data = format_cm(cm)
        categories = str(getCategories(question))
        return render(request, 'predict.html', {'data': QA, 'algorithms': algorithms, 'printcm': True, 'formatted_cm': data, 
            'categories': mark_safe(categories), 'acc': acc, 'question': question, 'algorithm': algorithm})

    return render(request, 'predict.html', {'data': QA, 'algorithms': algorithms, 'printcm': False})


def format_cm(cm):
    sz = len(cm)
    formatted_cm = []
    for i in range(sz):
        for j in range(sz):
            formatted_cm.append([sz-i-1,j,cm[i][j]])
    return str(formatted_cm)
