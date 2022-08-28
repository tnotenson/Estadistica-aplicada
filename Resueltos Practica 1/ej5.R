# datos = read.table(file.choose(), header = T)
datos = read.csv("/home/tomasnotenson/Escritorio/UDESA/Estadística Aplicada/Resueltos Practica 1/datasets/AlturasPesos.csv")
# tamaño de la muestra
print(length(datos$heigth))
# medidas de centralidad y dispersión
print('Alturas')
media_h = mean(datos$heigth)
des_est_h = sd(datos$heigth)
print(media_h)
print(des_est_h)
print('Pesos')
media_w = mean(datos$weigth)
des_est_w = sd(datos$weigth)
print(media_w)
print(des_est_w)
# grafico en ejes cartesianos la altura y el peso
plot(x=datos$heigth, y=datos$weigth, xlab='Heigth', ylab='Weigth')
print('Para cada sexo')
datos_male = datos[datos$gender=='male',] 
datos_fem = datos[datos$gender=='female',] 
plot(x=datos_fem$heigth, y=datos_fem$weigth, xlim=c(155, 185), ylim=c(53,80),main='Por sexo', xlab='Heigth', ylab='Weigth', col=rgb(0, 1, 0, alpha = 0.9))
points(x=datos_male$heigth, y=datos_male$weigth, col = rgb(1, 0, 0, alpha = 0.9))
legend("topleft", legend=c("female", "male"),
       col=c("red", "green"), cex = 0.8, pch = c(1, 1))
