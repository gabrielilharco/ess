# -*- coding: utf-8 -*-
# !/usr/bin/env python
"""Database reader."""
from web.core.models import populate_qa, populate_survey
from answers import QA
import pandas as pd


def log_database(reader):
    """Log the database for debug."""
    print "## logging fields ##"
    for field in reader:
        print field
    print "## logging values ##"
    for value in reader.values:
        print value
    print "## logging database ##"
    print reader


def load_database(countries):
    """Populate database with survey answers."""
    # Selecting databases and columns
    databases = ['ESS7PT.dta', 'ESS7IL.dta', 'ESS7GB.dta']
    columns = ['name', 'idno', 'cntry', 'dweight', 'pspwght', 'pweight']
    for question, fields in QA.iteritems():
        columns.append(fields['acronym'])

    # Reading and populating data
    populate_qa()
    for database in databases:
        if countries[database]:
            reader = pd.read_stata('data/database/' + database,
                                   convert_categoricals=False,
                                   columns=columns)
            populate_survey(reader, columns)
    # log_database(reader)


# Small STATA just for testing
# reader = pd.read_stata('carsdata.dta', convert_categoricals=False)
# log_database(reader)
