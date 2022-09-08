# defino parametros
n = 10
alfa = 0.1
CL = 1-alfa
# datos
Xi = c(0.123, 0.124, 0.126, 0.120, 0.130, 0.133, 0.125, 0.128, 0.124, 0.126)
# estimador de la varianza
S2 = var(Xi)
# grados de libertad
df = n-1
# cuantiles de la dist chi cuadrado 
b = qchisq(1-alfa/2, df)
a = qchisq(alfa/2, df)
print(a)
print(b)
# intervalo de confianza
IC_l = df*S2/b
IC_u = df*S2/a
print(IC_l)
print(IC_u)