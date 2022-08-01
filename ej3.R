n = 50
# genero una muestra N(0,1)
muestra = rt(n, 2)
media = mean(muestra)
des_est = sd(muestra)
print(media)
print(des_est)
# genero un boxplot
boxplot(muestra)
# ecdf
Fn = ecdf(muestra)
Pc = Fn(1.96)
print(Pc)
plot(Fn)
# genero un histograma
hist(muestra, prob=T, breaks="FD")#, ylim=c(0,0.4))
lines(density(muestra), lty='dashed')
curve(dt(x, 2), add=T, lty="dotted")