# -*- coding: utf-8 -*-
# !/usr/bin/env python
"""Database reader."""
import pandas as pd

# reader = pd.read_stata('ESS7PT.dta', chunksize=10)
# print "ok"
# for df in reader:
#     print(df.shape)
pd.read_stata(filepath_or_buffer='ESS7PT.dta', index=None)
