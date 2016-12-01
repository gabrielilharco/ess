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


def val(entry, column):
    """Column index inside entry."""
    return entry[selected_columns.index(column)]


def quest(entry, question):
    """Question index inside entry."""
    return int(val(entry, QA['Q' + question]['acronym']))


def populate_survey(reader):
    """Populate the database with survey answers."""
    for entry in reader.values:
        survey = Survey()
        survey.objects.update_or_create(
            idno=int(val(entry, 'idno')),
            name=val(entry, 'name'), cntry=val(entry, 'cntry'),
            q1=quest(entry, '1'), q2=quest(entry, '2'), q3=quest(entry, '3'),
            q4=quest(entry, '4'), q5=quest(entry, '5'), q6=quest(entry, '6'),
            q7=quest(entry, '7'), q8=quest(entry, '8'), q9=quest(entry, '9'),
            q10=quest(entry, '10'),
            dweight=float(val(entry, 'dweight')),
            pspweight=float(val(entry, 'pspwght')),
            pweight=float(val(entry, 'pweight'))
        )


# Small STATA just for testing
# reader = pd.read_stata('carsdata.dta', convert_categoricals=False)

# Selecting databases and columns
# databases = ['ESS7PT.dta']
databases = ['ESS7PT.dta', 'ESS7IL.dta', 'ESS7GB.dta']
selected_columns = ['name', 'idno', 'cntry', 'dweight', 'pspwght', 'pweight']
for question, fields in QA.iteritems():
    selected_columns.append(fields['acronym'])

# Populating database with STATA content
for database in databases:
    reader = pd.read_stata('database/' + database,
                           convert_categoricals=False,
                           columns=selected_columns)
    populate_survey(reader)
# log_database()
