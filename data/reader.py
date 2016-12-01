# -*- coding: utf-8 -*-
# !/usr/bin/env python
"""Database reader."""
from web.core.models import Survey
from answers import QA
import pandas as pd


def log_database():
    """Log the database for debug."""
    print "## logging fields ##"
    for field in reader:
        print field
    print "## logging values ##"
    for value in reader.values:
        print value
    print "## logging database ##"
    print reader


def pos(column):
    """Column index inside entry."""
    return selected_columns.index(column)


def pos_q(question):
    """Question index inside entry."""
    return pos(QA['Q' + question]['acronym'])


def populate_survey(reader):
    """Populate the database with survey answers."""
    for entry in reader.values:
        survey = Survey()
        survey.objects.update_or_create(
            name=entry[pos('name')],
            idno=entry[pos('idno')],
            cntry=entry[pos('cntry')],
            q1=entry[pos_q('1')],
            q2=entry[pos_q('2')],
            q3=entry[pos_q('3')],
            q4=entry[pos_q('4')],
            q5=entry[pos_q('5')],
            q6=entry[pos_q('6')],
            q7=entry[pos_q('7')],
            q8=entry[pos_q('8')],
            q9=entry[pos_q('9')],
            q10=entry[pos_q('10')],
            dweight=entry[pos('dweight')],
            pspweight=entry[pos('pspwght')],
            pweight=entry[pos('pweight')]
        )


# Small STATA just for testing
# reader = pd.read_stata('carsdata.dta', convert_categoricals=False)

# Selecting databases and columns
# databases = ['ESS7PT.dta', 'ESS7IL.dta', 'ESS7GB.dta']
databases = ['ESS7PT.dta']
selected_columns = ['name', 'idno', 'cntry', 'dweight', 'pspwght', 'pweight']
for question, fields in QA.iteritems():
    selected_columns.append(fields['acronym'])

# Populating database with STATA content
for database in databases:
    reader = pd.read_stata('database/' + database,
                           convert_categoricals=False,
                           columns=selected_columns)
    populate_survey(reader)
log_database()
