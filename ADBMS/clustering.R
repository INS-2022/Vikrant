## K Means Clustering

head(iris)
library(ggplot2)
## Plotting relation Petal.Length and Petal.Width. For 
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()

set.seed(20) # seed is set so that randomization gives the same result every time

irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)
irisCluster
## Table showing the result of  clustering
table(irisCluster$cluster, iris$Species)
## As the species is a factor or a nominal value, we convert it to a factor

irisCluster$cluster <- as.factor(irisCluster$cluster)
## Now plotting shows the diagram in distinct colors
ggplot(iris, aes(Petal.Length, Petal.Width, color = irisCluster$cluster)) + geom_point()



## Agglomerative Clustering

head(iris)
## Clustering using the same as previous, petal length and petal width
## Default clustering method is complete linkage
clusters <- hclust(dist(iris[, 3:4])) 
plot(clusters) 
clusterCut <- cutree(clusters, 3)
table(clusterCut, iris$Species) ## Table fn counts and shows how many are there

## Inner point shows the predicted value and outer point shows original value
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point(alpha = 0.4, size = 3.5) + geom_point(col = clusterCut) + scale_color_manual(values = c('black', 'red', 'green'))


## use method average for average linkage
clusters <- hclust(dist(iris[, 3:4]), method = 'average') 
plot(clusters) 
clusterCut <- cutree(clusters, 3) 
table(clusterCut, iris$Species) 
## Inner point shows the predicted value and outer point shows original value
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point(alpha = 0.4, size = 3.5) + geom_point(col = clusterCut) + scale_color_manual(values = c('black', 'red', 'green'))
