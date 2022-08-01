n = 50
# genero una muestra N(0,1)
muestra = rnorm(n)
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
# epdf
fn = epdf(muestra)
plot(fn)
# genero un histograma
hist(muestra, prob=T, breaks="FD")
lines(density(muestra), lty='dashed')
curve(dnorm(x, media, des_est), add=T, lty="dotted")
