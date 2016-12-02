# -*- coding: utf-8 -*-
# !/usr/bin/env python
"""Django Models."""
from django.db import models
from data.answers import QA
import sys

columns = []


class Survey(models.Model):
    """Survey answer to the questions."""

    name = models.CharField(null=False, blank=False, max_length=20,
                            help_text="ESS Edition and Year")
    idno = models.IntegerField(null=False, blank=False, unique=True,
                               help_text="Interviewee identification")
    cntry = models.CharField(null=False, blank=False, max_length=10,
                             help_text="Interviewee residence country")
    Q1 = models.ForeignKey('Q1', on_delete=models.CASCADE, help_text="Q1")
    Q2 = models.ForeignKey('Q2', on_delete=models.CASCADE, help_text="Q2")
    Q3 = models.ForeignKey('Q3', on_delete=models.CASCADE, help_text="Q3")
    Q4 = models.ForeignKey('Q4', on_delete=models.CASCADE, help_text="Q4")
    Q5 = models.ForeignKey('Q5', on_delete=models.CASCADE, help_text="Q5")
    Q6 = models.ForeignKey('Q6', on_delete=models.CASCADE, help_text="Q6")
    Q7 = models.ForeignKey('Q7', on_delete=models.CASCADE, help_text="Q7")
    Q8 = models.ForeignKey('Q8', on_delete=models.CASCADE, help_text="Q8")
    Q9 = models.ForeignKey('Q9', on_delete=models.CASCADE, help_text="Q9")
    Q10 = models.ForeignKey('Q10', on_delete=models.CASCADE, help_text="Q10")
    dweight = models.FloatField(null=False, blank=False, help_text="Weight")
    pspwght = models.FloatField(null=False, blank=False, help_text="Weight")
    pweight = models.FloatField(null=False, blank=False, help_text="Weight")

    class Meta:
        """Database column."""

        db_table = 'survey'


class Q1(models.Model):
    """How happy are you."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100,
                                   help_text="Question description 1")

    class Meta:
        """Database column."""

        db_table = 'q1'


class Q2(models.Model):
    """How often socially meet with friends, relatives or colleagues."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100,
                                   help_text="Question description 2")

    class Meta:
        """Database column."""

        db_table = 'q2'


class Q3(models.Model):
    """How many people with whom you can discuss intimate and personal matters."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100,
                                   help_text="Question description 3")

    class Meta:
        """Database column."""

        db_table = 'q3'


class Q4(models.Model):
    """Take part in social activities compared to others of same age."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100,
                                   help_text="Question description 4")

    class Meta:
        """Database column."""

        db_table = 'q4'


class Q5(models.Model):
    """Respondent or household member victim of burglary/assault last 5 years."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100,
                                   help_text="Question description 5")

    class Meta:
        """Database column."""

        db_table = 'q5'


class Q6(models.Model):
    """Feeling of safety of walking alone in local area after dark."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100,
                                   help_text="Question description 6")

    class Meta:
        """Database column."""

        db_table = 'q6'


class Q7(models.Model):
    """Subjective general health."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100,
                                   help_text="Question description 7")

    class Meta:
        """Database column."""

        db_table = 'q7'


class Q8(models.Model):
    """Hampered in daily activities by illness/disability/infirmity/mental problem."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100,
                                   help_text="Question description 8")

    class Meta:
        """Database column."""

        db_table = 'q8'


class Q9(models.Model):
    """Member of a group discriminated against in this country."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100,
                                   help_text="Question description 9")

    class Meta:
        """Database column."""

        db_table = 'q9'


class Q10(models.Model):
    """Belong to minority ethnic group in country."""

    key = models.IntegerField(null=False, blank=False, unique=True)
    description = models.CharField(null=False, blank=False, max_length=100,
                                   help_text="Question description 10")

    class Meta:
        """Database column."""

        db_table = 'q10'


def populate_qa():
    """Populate database with questions."""
    for question, fields in QA.iteritems():
        question_cls = getattr(sys.modules[__name__], question)
        for key, val in fields['answers'].iteritems():
            question_cls.objects.update_or_create(key=key, description=val)


def val(entry, column):
    """Column index inside entry."""
    return entry[columns.index(column)]


def quest(entry, n_question):
    """Question index inside entry."""
    question = 'Q' + n_question
    key = int(val(entry, QA[question]['acronym']))
    question_cls = getattr(sys.modules[__name__], question)
    return question_cls.objects.get(key=key)


def populate_survey(reader, cols):
    """Populate the database with survey answers."""
    global columns
    columns = cols
    for entry in reader.values:
        survey = Survey(
            idno=int(val(entry, 'idno')),
            name=val(entry, 'name'), cntry=val(entry, 'cntry'),
            Q1=quest(entry, '1'), Q2=quest(entry, '2'), Q3=quest(entry, '3'),
            Q4=quest(entry, '4'), Q5=quest(entry, '5'), Q6=quest(entry, '6'),
            Q7=quest(entry, '7'), Q8=quest(entry, '8'), Q9=quest(entry, '9'),
            Q10=quest(entry, '10'),
            dweight=float(val(entry, 'dweight')),
            pspwght=float(val(entry, 'pspwght')),
            pweight=float(val(entry, 'pweight')),
        )
        survey.save()
