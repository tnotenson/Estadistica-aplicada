#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 19 13:58:13 2022

@author: tomasnotenson
"""

import numpy as np
from random import choice
import seaborn as sns
from scipy.stats import norm

plt.rcParams.update({
"text.usetex": True,
"font.family": "sans-serif",
"font.sans-serif": ["Helvetica"], "font.size": 16})

Pa = norm.cdf(5.4, 3, 4)

print(f'a) P(X<=5.4)={Pa}')

Pb = 1 - norm.cdf(7, 3, 4)

print(f'b) P(X>7)={Pb}')

Pc = 1 - norm.cdf(0, 3, 4)

print(f'c) P(X>0)={Pc}')

Pd = norm.cdf(3.5, 3, 4) - norm.cdf(0.5, 3, 4)

print(f'd) P(|X-2|<=1.5)={Pd}')

t = norm.ppf(0.87, 3, 4)

print(f'e) t={t}')

Pf = norm.ppf(0.01, 3, 4)
b = 3 - Pf

print(f'f) b={b}')
#%% 