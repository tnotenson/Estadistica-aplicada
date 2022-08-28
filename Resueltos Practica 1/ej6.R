library(ggplot2)


ggplot(data = iris) +
  aes(x = Species, y = Sepal.Length, color = Species) +
  geom_boxplot()

ggplot(data = iris) +
  aes(x = Petal.Length, fill = Species) +
  geom_density(alpha = 0.3)