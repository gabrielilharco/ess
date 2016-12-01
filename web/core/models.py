from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from data.answers import QA
import sys

# How happy are you
class Q1(models.Model):
	key = models.IntegerField(null=False, blank=False, unique=True)
	description = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'q1'

# How often socially meet with friends, relatives or colleagues
class Q2(models.Model):
	key = models.IntegerField(null=False, blank=False, unique=True)
	description = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'q2'

# How many people with whom you can discuss intimate and personal matters
class Q3(models.Model):
	key = models.IntegerField(null=False, blank=False, unique=True)
	description = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'q3'

# Take part in social activities compared to others of same age
class Q4(models.Model):
	key = models.IntegerField(null=False, blank=False, unique=True)
	description = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'q4'

# Respondent or household member victim of burglary/assault last 5 years
class Q5(models.Model):
	key = models.IntegerField(null=False, blank=False, unique=True)
	description = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'q5'

# Feeling of safety of walking alone in local area after dark
class Q6(models.Model):
	key = models.IntegerField(null=False, blank=False, unique=True)
	description = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'q6'

# Subjective general health
class Q7(models.Model):
	key = models.IntegerField(null=False, blank=False, unique=True)
	description = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'q7'

# Hampered in daily activities by illness/disability/infirmity/mental problem
class Q8(models.Model):
	key = models.IntegerField(null=False, blank=False, unique=True)
	description = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'q8'

# Member of a group discriminated against in this country
class Q9(models.Model):
	key = models.IntegerField(null=False, blank=False, unique=True)
	description = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'q9'

# Belong to minority ethnic group in country
class Q10(models.Model):
	key = models.IntegerField(null=False, blank=False, unique=True)
	description = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'q10'

def populate_qa():
	for question, fields in QA.iteritems():
		question_cls = getattr(sys.modules[__name__], question)
		for key, val in fields['answers'].iteritems():
			question_cls.objects.update_or_create(key=key, description=val)