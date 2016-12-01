# -*- coding: utf-8 -*-
# !/usr/bin/env python
"""Django Models."""
from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from data.answers import QA
import sys


class Survey(models.Model):
    """Survey answer to the questions."""

    name = models.CharField(null=False, blank=False, max_length=20)
    idno = models.IntegerField(null=False, blank=False, unique=True)
    cntry = models.CharField(null=False, blank=False, max_length=10)
    Q1 = models.ForeignKey('Q1', on_delete=models.CASCADE)
    Q2 = models.ForeignKey('Q2', on_delete=models.CASCADE)
    Q3 = models.ForeignKey('Q3', on_delete=models.CASCADE)
    Q4 = models.ForeignKey('Q4', on_delete=models.CASCADE)
    Q5 = models.ForeignKey('Q5', on_delete=models.CASCADE)
    Q6 = models.ForeignKey('Q6', on_delete=models.CASCADE)
    Q7 = models.ForeignKey('Q7', on_delete=models.CASCADE)
    Q8 = models.ForeignKey('Q8', on_delete=models.CASCADE)
    Q9 = models.ForeignKey('Q9', on_delete=models.CASCADE)
    Q10 = models.ForeignKey('Q10', on_delete=models.CASCADE)
    dweight = models.FloatField(null=False, blank=False)
    pspwght = models.FloatField(null=False, blank=False)
    pweight = models.FloatField(null=False, blank=False)

    class Meta:
        """Database column."""

        db_table = 'survey'


class Q1(models.Model):
    """How happy are you."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100)

    class Meta:
        """Database column."""

        db_table = 'q1'


class Q2(models.Model):
    """How often socially meet with friends, relatives or colleagues."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100)

    class Meta:
        """Database column."""

        db_table = 'q2'


class Q3(models.Model):
    """How many people with whom you can discuss intimate and personal matters."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100)

    class Meta:
        """Database column."""

        db_table = 'q3'


class Q4(models.Model):
    """Take part in social activities compared to others of same age."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100)

    class Meta:
        """Database column."""

        db_table = 'q4'


class Q5(models.Model):
    """Respondent or household member victim of burglary/assault last 5 years."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100)

    class Meta:
        """Database column."""

        db_table = 'q5'


class Q6(models.Model):
    """Feeling of safety of walking alone in local area after dark."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100)

    class Meta:
        """Database column."""

        db_table = 'q6'


class Q7(models.Model):
    """Subjective general health."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100)

    class Meta:
        """Database column."""

        db_table = 'q7'


class Q8(models.Model):
    """Hampered in daily activities by illness/disability/infirmity/mental problem."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100)

    class Meta:
        """Database column."""

        db_table = 'q8'


class Q9(models.Model):
    """Member of a group discriminated against in this country."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100)

    class Meta:
        """Database column."""

        db_table = 'q9'


class Q10(models.Model):
    """Belong to minority ethnic group in country."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100)

    class Meta:
        """Database column."""

        db_table = 'q10'


def populate_qa():
    """Populate database with questions."""
    for question, fields in QA.iteritems():
        question_cls = getattr(sys.modules[__name__], question)
        for key, val in fields['answers'].iteritems():
            question_cls.objects.update_or_create(key=key, description=val)
