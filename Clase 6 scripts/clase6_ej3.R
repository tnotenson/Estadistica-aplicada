# defino parametros
n = 100
# estimador de des est
sqS2 = 12
# estimador promedio
Xbar = 64
# defino alfa
alfa = 0.05
# grados de libertad
df = n-1
# cuantiles de la t student
b = qt(1-alfa/2, df)
a = qt(alfa/2, df)
print(a)
print(b)
# intervalo de confianza
IC_l = Xbar - b * sqS2/sqrt(n)
IC_u = Xbar - a * sqS2/sqrt(n)
print(IC_l)
print(IC_u)