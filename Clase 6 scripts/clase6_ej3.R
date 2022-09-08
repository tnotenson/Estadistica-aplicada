n = 100
sqS2 = 12
Xbar = 64
alfa = 0.05

df = n-1

b = qt(1-alfa/2, df)
a = qt(alfa/2, df)

print(a)
print(b)

IC_l = Xbar - b * sqS2/sqrt(n)
IC_u = Xbar - a * sqS2/sqrt(n)

print(IC_l)
print(IC_u)