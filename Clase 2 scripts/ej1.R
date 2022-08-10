
library(ggplot2)

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


