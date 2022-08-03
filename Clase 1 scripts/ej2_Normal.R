Pa = pnorm(5.4, 3, 4)

print('a) P(X<=5.4)=')
print(Pa)

Pb = 1 - pnorm(7, 3, 4)

print('b) P(X>7)=')
print(Pb)

Pc = 1 - pnorm(0, 3, 4)

print('c) P(X>0)=')
print(Pc)

Pd = pnorm(3.5, 3, 4) - pnorm(0.5, 3, 4)

print('d) P(|X-2|<=1.5)=')
print(Pd)

t = qnorm(0.87, 3, 4)

print('e) t=')
print(t)

Pf = qnorm(0.01, 3, 4)
b = 3 - Pf

print('f) b=')
print(b)
