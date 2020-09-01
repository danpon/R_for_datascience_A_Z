data(iris)

install.packages("plotly")

library(plotly)
library(ggplot2)
library(dplyr)

plot(x=iris$Sepal.Length,y=iris$Sepal.Width,xlab='Longeur',ylab='Largeur',col='red',
     xlim=c(min(iris$Sepal.Length,iris$Petal.Length),max(iris$Sepal.Length,iris$Petal.Length)))
lines(x=iris$Petal.Length,y=iris$Petal.Width,col='blue',type='p',pch=22)
title(main='Longueur en fonction de largeur')
legend(1,4.2,c('Sepal','Petal'),col=c('red','blue'),pch=21:22)


# plot = data + aesthetics + Geometry

g <- ggplot(iris, aes(x=Petal.Length,y=Petal.Width))
g <- g + geom_point()

# couleur selon l'espèce
g <- ggplot(iris, aes(x=Petal.Length,y=Petal.Width,color=Species,shape=Species)) + 
        geom_point(size=3)

# créer un gradient de couleur
g <- ggplot(iris, aes(x=Petal.Length,y=Petal.Width,color=Petal.Length,shape=Species)) + 
        geom_point(size=3) +
        scale_color_gradient(low='blue',high='red')

# modifier le fond de notre graphique
g <- g+theme_minimal()

# modifier la position de la légende
g <- g + theme(legend.position='bottom')

# supression titre légende
g <- ggplot(iris, aes(x=Petal.Length,y=Petal.Width,color=Petal.Length,shape=Species)) + 
  geom_point(size=3) +
  scale_color_gradient(low='blue',high='red') +
  theme_minimal() +
  theme(legend.title = element_blank())

# modifie couleur, texture, titre de la légende
g <- ggplot(iris, aes(x=Petal.Length,y=Petal.Width,color=Petal.Length,shape=Species)) + 
  geom_point(size=3) +
  scale_color_gradient(low='blue',high='red') +
  theme_minimal() +
  theme(legend.title = element_text(color='red',size=15, face='bold'))


# modifier couleur,texture taille des labels de la légende
g <- ggplot(iris, aes(x=Petal.Length,y=Petal.Width,color=Petal.Length,shape=Species)) + 
  geom_point(size=3) +
  scale_color_gradient(low='blue',high='red') +
  theme_minimal() +
  theme(legend.title = element_text(color='red',size=15, face='bold'))+
  theme(legend.text = element_text(color='blue',size=8, face='bold.italic'))
g

# ajouter un cadre à notre légende
g <- ggplot(iris, aes(x=Petal.Length,y=Petal.Width,color=Petal.Length,shape=Species)) + 
  geom_point(size=3) +
  scale_color_gradient(low='blue',high='red') +
  theme_minimal() +
  theme(legend.title = element_text(color='red',size=15, face='bold'))+
  theme(legend.text = element_text(color='blue',size=8, face='bold.italic')) +
  theme(legend.background =  element_rect(fill='gray', size=2,linetype = 'dotted'))
g

# modification du nom des axes et ajout d'un titre au graphique
g <- ggplot(iris, aes(x=Petal.Length,y=Petal.Width,color=Petal.Length,shape=Species)) + 
  geom_point(size=3) +
  scale_color_gradient(low='blue',high='red') +
  theme_minimal() +
  theme(legend.title = element_text(color='steelblue',size=15, face='bold')) +
  theme(legend.text = element_text(color='steelblue',size=8, face='bold.italic')) +
  xlab('Longueur des pétales') +
  ylab('Largeur des pétales') +
  ggtitle('Longueur des pétales en fonction de la largeur des pétales') +
  theme(plot.title = element_text(colour='steelblue',size=15,face='bold')) +
  theme(axis.title = element_text(colour='steelblue',size=10,face='bold')) +
  theme(axis.text = element_text(colour='steelblue',size=10,face='bold',angle=45)) +
  theme(axis.line = element_line(colour='steelblue',size=2,linetype='dotted'))
g

# facets
g <- ggplot(iris, aes(x=Petal.Length,y=Petal.Width,color=Petal.Length,shape=Species)) + 
  geom_point(size=3) +
  scale_color_gradient(low='blue',high='red') +
  theme_minimal() +
  theme(legend.title = element_text(color='steelblue',size=15, face='bold')) +
  theme(legend.text = element_text(color='steelblue',size=8, face='bold.italic')) +
  xlab('Longueur des pétales') +
  ylab('Largeur des pétales') +
  ggtitle('Longueur des pétales en fonction de la largeur des pétales') +
  theme(plot.title = element_text(colour='steelblue',size=15,face='bold')) +
  theme(axis.title = element_text(colour='steelblue',size=10,face='bold')) +
  theme(axis.text = element_text(colour='steelblue',size=10,face='bold',angle=45)) +
  #facet_wrap(~Species,ncol = 1)+
  facet_wrap(~Species)+
  theme(strip.text = element_text(colour='steelblue',size=10) ) +
  theme(strip.background = element_rect(colour = 'steelblue',size=1,linetype = 'solid'))
g

# modification du nom des axes et ajout d'un titre au graphique
g <- ggplot(iris, aes(x=Petal.Length,y=Petal.Width,color=Petal.Length,shape=Species)) + 
  geom_point(size=3) +
  scale_color_gradient(low='blue',high='red') +
  theme_minimal() +
  theme(legend.title = element_text(color='steelblue',size=15, face='bold')) +
  theme(legend.text = element_text(color='steelblue',size=8, face='bold.italic')) +
  xlab('Longueur des pétales') +
  ylab('Largeur des pétales') +
  ggtitle('Longueur des pétales en fonction de la largeur des pétales') +
  theme(plot.title = element_text(colour='steelblue',size=15,face='bold')) +
  theme(axis.title = element_text(colour='steelblue',size=10,face='bold')) +
  theme(axis.text = element_text(colour='steelblue',size=10,face='bold',angle=45)) +
  annotate('text', x=c(2,4,6), y=0.7,label=c('setosa','versicolor','virginica'),color='steelblue',size=3,fontface='bold')+
  annotate('rect', xmin=0.5, xmax=2.1, ymin=0,ymax=0.65, alpha=0.2,colour='steelblue',size=2) +
  annotate('segment', x=0.5, xend=4, y=1.5,yend=0,size=2,alpha=0.5) 
g

ggplotly(g)


# histogramme sur les données iris
png('hitogramme_iris.png')
# modification du nom des axes et ajout d'un titre au graphique
g <- ggplot(iris, aes(x=Petal.Length, fill=Species)) +
      geom_histogram(color='white',binwidth = 0.5)
g
dev.off()

# boxplot
pdf('boxplot_iris.pdf')
g <- ggplot(iris, aes(x=Species,y=Petal.Length, fill=Species)) +
  geom_boxplot() +
  ggtitle("Boxplot de la longueur de pétales selon l'espèce") +
  xlab('Espèce') +
  ylab('Longueur des pétales')
g
dev.off()
ggplotly(g)

fast_food=read.csv('data/FastFoodRestaurants.csv')
fast_food_tibble = as_tibble(fast_food)

# 10 villes avec le plus de fastfood?
city_list = fast_food_tibble  %>% group_by(city) %>% 
  count() %>% 
  arrange(desc(n)) %>%
  head(10) %>%
  pull(city)

fast_food_tibble_10_villes = fast_food_tibble %>%
                                filter(city %in% city_list )

list_fast_food  = fast_food_tibble_10_villes %>%
                    group_by(name) %>%
                    summarise(Nbre_restaurants=length(name)) %>%
                    arrange(desc(Nbre_restaurants)) %>%
                    head(10) %>%
                    pull(name)

fast_food_tibble_10_villes_10_restaurants = fast_food_tibble_10_villes %>%
                    filter(name %in% list_fast_food )
pdf('fast_food.pdf')
g =ggplot(fast_food_tibble_10_villes_10_restaurants,aes(city,fill=name)) +
                    geom_bar() +
                    theme_minimal() +
                    xlab("Les 10 capitales du fast food") +
                    ylab("Les 10 restaurants les plus implémentés") +
                    ggtitle("Les 10 restaurants les plus implémentés \ndans les 10 capitales du fast food") +
                    theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(face = "bold", size=7, angle=45)) +
                    ylim(0,100) +
                    theme(legend.title = element_blank()) +
                    scale_fill_brewer(palette="Paired")
g
dev.off()



ggplotly(g)