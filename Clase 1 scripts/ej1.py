#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 19 13:27:38 2022

Ej1 Estadística Aplicada

@author: tomasnotenson
"""

import numpy as np
from random import choice
import seaborn as sns

plt.rcParams.update({
"text.usetex": True,
"font.family": "sans-serif",
"font.sans-serif": ["Helvetica"], "font.size": 16})

# defino los valores posibles de los dados
white = np.arange(6)+1
blue = np.arange(6)+1

Nc = int(1e5)

s_array = np.zeros(Nc)
r_array = np.zeros(Nc)

for i in range(Nc):
    # tiro los dados y sumo
    
    x1 = choice(white)
    x2 = choice(blue)
    
    s = x1+x2 
    
    if s < 10:
        r = 0 
    else:
        r = s
    s_array[i] = s
    r_array[i]= r

sns.histplot(s_array,stat='density')
plt.figure()
sns.histplot(r_array,stat='density')
#%% esperanza y varianza

Ex = 10/12+11/18+12/36

Ex2 = 10**2/12+11**2/18+12**2/36

Varx = Ex2 - Ex**2 

print('E(X)={}, Var(X)={}'.format(Ex, Varx))
