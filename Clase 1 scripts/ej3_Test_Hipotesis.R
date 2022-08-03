N = 25
alpha = 0.05
upper_lim = qnorm(1-alpha/2)
lower_lim = qnorm(alpha/2)
# b)
print('Región de aceptación de H0: Z en')
print(lower_lim)
print(upper_lim)

# c)
mu = 2 
sigma = 1/20
xbar = 1.983

Z = (xbar - mu)/(sigma/sqrt(N))

print('Z*=')
print(Z)
print('Como Z* cae en la zona de rechazo de H0, me quedo con Ha\n')

# d) potencia del test
P1 = 1-pnorm(qnorm(1-alpha/2)-sqrt(N))
print(P1)
P2 = pnorm(-qnorm(1-alpha/2)-sqrt(N))
print(P2)
print('potencia del test')
print(P1+P2)

### EXTRA: Hago la simulación 

Nc = 1e4

Zs = replicate(Nc,0)

for (n in 1:Nc){
  xbar = mean(rnorm(N, mu+sigma, sigma))
  Z = (xbar - mu)/(sigma/sqrt(N))
  Zs[n] = Z
}
#%% ploteo 
# primero veamos la simulación
hist(Zs, prob=T, xlim=c(-3,8), xlab='Z')
lines(density(Zs))

# luego las distribuciones "teóricas" (calculadas analíticamente)
# defino el dominio de las gaussianas
domZ = seq(-3,8,1/1000)
# si H0 es cierta
lines(domZ, dnorm(domZ), col='red')
# si Ha es cierta
lines(domZ, dnorm(domZ, sqrt(N), 1), col='blue')
