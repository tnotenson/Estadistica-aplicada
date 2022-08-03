# En el Casino de Probaville diseñaron un nuevo juego para la diversión de
# los concurrentes. Para participar hay que pagar 5 dólares. El juego consiste
# en lo siguiente: se arrojan un dado blanco y un dado azul y se calcula la
# suma de los números obtenidos. Si esta suma es menor que 10, no se cobra
# nada. En cambio, si la suma es un número n ≥ 10, se cobran n dólares.
# Definir una variable aleatoria que describa la ganancia obtenida al jugar a
# este juego una sola vez, explicitar el espacio muestral en el que está definida
# esta variable y hallar su función de frecuencia, su función de distribución
# acumulada, su esperanza y varianza.


# defino los valores posibles de los dados
white = c(1:6)
blue = c(1:6)

# cantidad de experimentos
Nc = 1e5

# inicializo "arrays" de ceros con tamaño Nc
s_array = replicate(Nc, 0)
r_array = replicate(Nc, 0)

# repito Nc veces el experimento
for (i in 1:Nc){
  # tiro los dados y sumo
  # tiro el blanco
  x1 = sample(white,1)
  # tiro el azul
  x2 = sample(blue,1)
  
  # sumo
  s = x1+x2 
  
  # si s<10 entonces r = 0 
  if (s < 10){
    r = 0 
  } else{ # si s>=10 entonces r=s
    r = s}
  # guardo los resultados
  s_array[i] = s
  r_array[i] = r
}

# hago un histograma de los datos obtenidos en el experimento simulado
# es una estimación de la distribución de frecuencias (o en este caso de probabilidades)
hist(s_array, prob=T, xlab='suma blanco+azul', col=rgb(1,0,1,0.5)) #prob=True normaliza el histograma de frecuencias para que representen probabilidades
hist(r_array, prob=T, xlab='ganancia blanco+azul', col=rgb(0,1,1,0.5))

# estimo la distribución acumulada con la función ecdf ("empirical cumulative distribution function")
Fn = ecdf(r_array)
rs = c(0:12)
plot(Fn(rs), xlab='suma blanco+azul', ylab='ECDF(suma)', type = "S", lty = 1)

# estimamos la esperanza
print(mean(r_array))

# estimamos la varianza y la desviación estándar
print(var(r_array))
print(sd(r_array))

# calculamos el cociente entre la esperanza y la desviación estándar
print(mean(r_array)/sd(r_array))