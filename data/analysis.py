from web.core.models import Survey
from django.contrib.contenttypes.models import ContentType

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
    return { 'success': True, 'question': questionID, 'frequency': freq_answers }
    
