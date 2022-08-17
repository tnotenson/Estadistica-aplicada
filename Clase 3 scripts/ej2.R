P_XY = matrix(0,2,6)

PA_rojo = 1/3
PA_negro= 2/3

PB_rojo = 1/2
PB_negro= 1/2

for (x in 0:1) {
  for (y in 0:5) {
    if (x == 0){
      P_XY[x+1,y+1] = 1/8*dbinom(y,5,PA_rojo)
    }
    if (x == 1){
      P_XY[x+1,y+1] = 7/8*dbinom(y,5,PB_rojo)
    }
  }
}
print(P_XY)

#%% ej 2. clase 3
P_X = matrix(0,2)
for (x in 1:2){
  # prob condicional
  P_X[x] = sum(asub(P_XY, x,1))
}
print(P_X)
P_Y = matrix(0,6)
for (y in 1:6){
  # prob condicional
  P_Y[y] = sum(asub(P_XY, y,2))
}
print(P_Y)
# promedio

Eycond = matrix(0,2)
for (x in 0:1){
  
  if (x==0){
    for (y in 0:5){ 
      Eycond[1] = Eycond[1] + y*dbinom(y,5,1/3)
    }
    print(Eycond[1])
  }  
  if (x==1){
    for (y in 0:5){ 
      Eycond[2] = Eycond[2] + y*dbinom(y,5,1/2)
    }
    print(Eycond[2])
  }
}

# Ey = P_X[1]*Eycond[1] + P_X[2]*Eycond[2]
Ey = print(sum(P_X*Eycond))
print(Ey)
