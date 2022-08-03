#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 19 14:20:14 2022
Estadística Aplicada - UDESA

Clase 2

Ej. 3
@author: tomasnotenson
"""

import numpy as np
from random import choice
import seaborn as sns
from scipy.stats import norm, chi2
import matplotlib.pyplot as plt

plt.rcParams.update({
"text.usetex": True,
"font.family": "sans-serif",
"font.sans-serif": ["Helvetica"], "font.size": 16})

N = 25
alpha = 0.1
upper_lim = norm.ppf(1-alpha/2)
lower_lim = norm.ppf(alpha/2)
# b)
print(f'Región de aceptación de H0: Z en [{lower_lim:.2f},{upper_lim:.2f}]')
# print(f'Región de rechazo de H0: Z en ({lim:.2f}, +inf)')

# c)
mu = 2 
sigma = 1/20
xbar = 1.983

Z = (xbar - mu)/(sigma/np.sqrt(N))

print(f'Z*={Z}')
print(f'Como Z* cae en la zona de rechazo de H0, me quedo con Ha\n')
#%%d) con montecarlo 

Nc = int(1e4)

Zs = np.zeros(Nc)

for n in range(Nc):
    xbar = np.mean(norm.rvs(mu+sigma, sigma, size=N))
    
    Z = (xbar - mu)/(sigma/np.sqrt(N))
    Zs[n] = Z

x = np.linspace(norm.ppf(0.01),
                norm.ppf(0.99, np.sqrt(N)), 100)
y1 = norm.pdf(x)

plt.figure(figsize=(10,6))

plt.plot(x, y1,
       'r-', lw=2, alpha=0.6, label=r'$H_0$')
# sns.histplot(Zs, stat='density', kde=True, label='Ha')    
plt.plot(x, norm.pdf(x, loc=np.sqrt(N), scale=1),
       'b-', lw=2, alpha=0.6, label=r'$H_A$')
plt.grid(True)
plt.legend(loc='best')
plt.xlabel(r'$x$')
plt.ylabel(r'$f_X(x)$')
plt.savefig('potencia_test_d_Clase1_ej1.png', dpi=100)

# upper_lim = norm.ppf(0.95,mu,sigma)
# lower_lim = norm.ppf(0.05,mu,sigma)
potencia = norm.cdf(lower_lim,np.sqrt(N),1) +  (1 - norm.cdf(upper_lim,np.sqrt(N),1))

print(f'La potencia del test es de {potencia}')

pot2 = 1-norm.cdf(norm.ppf(1-alpha/2) - np.sqrt(N)) + norm.cdf(-norm.ppf(1-alpha/2) - np.sqrt(N))
print(f'La potencia del test es de {pot2}')
#%% MAL 
#d)a lo bestia

x = np.linspace(norm.ppf(0.01,mu,sigma),
                norm.ppf(0.99,mu,sigma), 100)

y1 = norm.pdf(x,mu,sigma)

y2 = norm.pdf(x,mu+sigma,sigma)
plt.figure()
plt.plot(x, y1,
       'r-', lw=2, alpha=0.6, label='H0')
plt.plot(x, y2,
       'b-', lw=2, alpha=0.6, label='HA')
plt.vlines(norm.ppf(0.05,mu,sigma),0,max(y1),ls='dashed',lw=1,color='black')
plt.vlines(norm.ppf(0.95,mu,sigma),0,max(y1),ls='dashed',lw=1,color='black')
plt.grid(True)
plt.legend(loc='best')
plt.xlabel(r'$x$')
plt.ylabel(r'$f_X(x)$')
plt.savefig('MAL_HECHO_potencia_test_d_Clase1_ej1.png', dpi=100)

upper_lim = norm.ppf(0.95,mu,sigma)
lower_lim = norm.ppf(0.05,mu,sigma)
potencia = norm.cdf(lower_lim,mu+sigma,sigma) +  (1 - norm.cdf(upper_lim,mu+sigma,sigma))

print(f'La potencia del test es de {potencia}')