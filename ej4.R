datos = read.table(file.choose(), header = T)
# tamaño de la muestra
print(length(datos[,1]))
# medidas de centralidad y dispersión
print('Todos')
media = mean(datos[,1])
des_est = sd(datos[,1])
print(media)
print(des_est)
# idem para cada sexo
print('Hombres')
datos_h = datos[datos[,2]=='male',]
media_h = mean(datos_h[,1])
des_est_h = sd(datos_h[,1])
print(media_h)
print(des_est_h)
print('Mujeres')
datos_m = datos[datos[,2]=='female',]
media_m = mean(datos_m[,1])
des_est_m = sd(datos_m[,1])
print(media_m)
print(des_est_m)
# ploteo todos los datos
hist(datos[,1], prob=T, main = "Todos", xlab='X')
curve(dnorm(x, media, des_est), add=T, lty="dotted")
lines(density(datos[,1]), lty='dashed')
# ploteo ambas distribuciones
hist(datos_h[,1], prob=T, main = "Separado por sexo", xlab='X')
curve(dnorm(x, media_h, des_est_h), add=T, lty="dotted")
lines(density(datos_h[,1]))
hist(datos_m[,1], prob=T, add = T,col = rgb(1, 0, 0, alpha = 0.5))
curve(dnorm(x, media_m, des_est_m), add=T, lty="dotted",col = rgb(1, 0, 0, alpha = 0.5))
lines(density(datos_m[,1]),col = rgb(1, 0, 0, alpha = 0.5))
# t.test(datos_h$heigth, datos_m$heigth, alternative = "greater")
# wilcox.test(datos_h$heigth, datos_m$heigth)