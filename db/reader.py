# -*- coding: utf-8 -*-
# !/usr/bin/env python
"""Database reader."""
import pandas as pd


def log_database():
    """Log the database."""
    print "## logging fields ##"
    for field in reader:
        print(field)
    print "## logging database ##"
    print reader


# reader = pd.read_stata('carsdata.dta', convert_categoricals=False)
reader = pd.read_stata('ESS7PT.dta', convert_categoricals=False)
log_database()
