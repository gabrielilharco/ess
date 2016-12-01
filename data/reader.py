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

# Small STATA just for testing
# reader = pd.read_stata('carsdata.dta', convert_categoricals=False,
#                       columns = ['cars'])
reader = pd.read_stata(
    'ESS7PT.dta', convert_categoricals=False,
    columns=[
        'name', 'essround', 'proddate', 'idno', 'cntry',
        'happy', 'sclmeet', 'inprdsc', 'sclact', 'crmvct',
        'aesfdrk', 'health', 'hlthhmp', 'rlgblg', 'rlgblge',
        'rlgdgr', 'rlgatnd', 'pray',
        'dscrgrp', 'cntbrthc', 'livecnta', 'lnghom1', 'lnghom2',
        'blgetmg', 'fbrncntb', 'mbrncntb',
        'dweight', 'pspwght', 'pweight'
    ])
log_database()


'''
Selected Fields
----------------------------------------------
How happy are you
How often socially meet with friends, relatives or colleagues
How many people with whom you can discuss intimate and personal matters
Take part in social activities compared to others of same age
Respondent or household member victim of burglary/assault last 5 years
Feeling of safety of walking alone in local area after dark
Subjective general health
Hampered in daily activities by illness/disability/infirmity/mental problem
Belonging to particular religion or denomination
Ever belonging to particular religion or denomination
How religious are you
How often attend religious services apart from special occasions
How often pray apart from at religious services
Member of a group discriminated against in this country
Country of birth
What year you first came to live in country
Language most often spoken at home: first mentioned
Language most often spoken at home: second mentioned
Belong to minority ethnic group in country
Country of birth, father
Country of birth, mother
'''
