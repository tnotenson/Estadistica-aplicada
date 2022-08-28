#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Aug 26 11:39:15 2022

@author: tomasnotenson
"""

import numpy as np 
from scipy.stats import uniform
import matplotlib.pyplot as plt
import seaborn as sb

Nc = 10000

xs = np.zeros((Nc)); ys = np.zeros((Nc))

for n in range(Nc):
    x = uniform.rvs(0,1,size=1)
    xs[n] = x
    ys[n] = uniform.rvs(0,x,size=1)
    
plt.figure(figsize=(10,10))
plt.hist2d(xs,ys, bins=20)
plt.xlabel(r'$X$')
plt.ylabel(r'$Y$')
plt.savefig('pr2ej5.png', dpi=80)
#%%
dom = np.linspace(0,1,1001)

plt.figure(figsize=(10,10))
# plt.hist(ys, bins=20, density=True)
sb.histplot(ys, stat='density')
plt.plot(dom,-np.log(dom), '-', label='1/y')
plt.xlabel(r'$Y$')
plt.legend(loc='best')
plt.grid(True)
plt.savefig('marginalY_pr2ej5.png', dpi=80)
#%%
plt.figure(figsize=(10,10))
# plt.hist(xs, bins=20, density=True)
sb.histplot(xs, stat='density')
plt.plot(dom,np.ones(len(dom)),'-', label='U(0,1)')
plt.xlabel(r'$X$')
plt.legend(loc='best')
plt.savefig('marginalX_pr2ej5.png', dpi=80)