from web.core.models import Survey
from django.contrib.contenttypes.models import ContentType
from sklearn.model_selection import train_test_split
import numpy as np
from sklearn import svm, tree, naive_bayes, neighbors
from sklearn.metrics import confusion_matrix, accuracy_score
from web.core.models import Survey

valid_questions = ['Q1', 'Q2', 'Q3', 'Q4', 'Q5', 'Q6', 'Q7', 'Q8', 'Q9', 'Q10']

def frequency_counter(questionID):
    if questionID not in valid_questions:
        return { 'error': True }
    ct = ContentType.objects.get(model=questionID.lower())
    question = ct.model_class()
    
    freq_answers = []
    for obj in question.objects.all():
        frequency = Survey.objects.filter(**{questionID: obj.key}).count()
        freq_answers.append([str(obj.description), frequency])
	return { 'type': 'piechart', 'success': True, 'question': questionID, 'frequency': freq_answers }

def get_survey_np_data():
    """Returns all survey answers as np data"""
    surveys = Survey.objects.all().values_list()
    return np.array(surveys)

def get_statistics(question, algorithm):
    """Returns statistics for a given classifier"""
    print "Loading data..."
    label = int(question[1:])+3
    surveys = get_survey_np_data()
    q_set = [4,5,6,7,8,9,10,11,12,13]
    q_set.remove(label)
    X = surveys[:, q_set]
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
    
    print "Calculating confusion matrix and accuracy"
    cm = confusion_matrix(y_test, y_pred)
    accuracy = accuracy_score(y_test, y_pred)
    print cm
    print accuracy

    return cm, accuracy


def frequency_by_country(questionID):
	if questionID not in valid_questions:
		return { 'error': True }

	ct = ContentType.objects.get(model=questionID.lower())
	question = ct.model_class()

	freq_answers = []
	for obj in question.objects.all():
		frequency = Survey.objects.filter(**{questionID: obj.key}).count()
		freq_answers.append([str(obj.description), frequency])
	return { 'type': 'treemap', 'success': True, 'question': questionID, 'frequency': freq_answers }
