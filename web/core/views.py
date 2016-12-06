# -*- coding: utf-8 -*-
"""Views controller."""
from django.shortcuts import render, render_to_response
from django.template import RequestContext
from data.reader import load_database
from web.core.models import Survey
import numpy as np
from sklearn import svm, tree, naive_bayes, neighbors
from sklearn.metrics import confusion_matrix
from sklearn.model_selection import train_test_split

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
        'analyse.html', context_instance=RequestContext(request))

def get_survey_np_data():
    """Returns all survey answers as np data"""
    surveys = Survey.objects.all().values_list()
    return np.array(surveys)


def get_statistics(label, others, algorithm):
    """Returns statistics for a given classifier"""
    print "Loading data..."
    surveys = get_survey_np_data()
    X = surveys[:, others]
    y = surveys[:, [label]].ravel()
    if algorithm == 1:
        clf = svm.SVC()
    elif algorithm == 2:
        clf = tree.DecisionTreeClassifier()
    elif algorithm == 3:
        clf = naive_bayes.GaussianNB()
    else:
        clf = neighbors.NearestNeighbors()


    X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=0)
    print "Fitting on training set..."
    clf.fit(X_train, y_train)

    print "Predicting on test set..."
    y_pred = clf.predict(X_test)
    
    print "Calculation confusion matrix:"
    cm = confusion_matrix(y_test, y_pred)
    print cm


