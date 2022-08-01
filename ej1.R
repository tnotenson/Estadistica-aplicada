## ej 1
library(geometry)
library(matlib)
# a)
a = 1/(2*3+5)
print(a)
# b)
u = c(2, 3, 4, 5)
v = c(1, 0, 1/2, 7)

w = u + v
print(w)
z = 2*u - v
print(z)

puv = dot(u,v)
# c)
fila_1 = c(1:3)
fila_2 = c(3/4, 4, 7)
fila_3 = c(0:2)
A = rbind(fila_1, fila_2, fila_3)
print(A)
print(det(A))
print(inv(A))
print(inv(A)%*%A)
