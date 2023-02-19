## Naive Bayes

library(ggplot2)
my_data <-iris
names(my_data)
dim(my_data)
#randomize
my_data <- my_data[sample(nrow(my_data), ), ]
head(my_data)
TrainData <- my_data[1:floor(dim(my_data)[1]*0.7),]
TestData <- my_data[ceil(dim(my_data)[1]*0.7):dim(my_data)[1],]

# plotting graph

pairs(iris[1:4], main="Iris Data (red=setosa,green=versicolor,blue=virginica)",
      pch=21, bg=c("red","green3","blue")[unclass(iris$Species)])

xTrain <- TrainData[,-5]
yTrain <- TrainData$Species
xTest <- TestData[,-5]
yTest <- TestData$Species
model=train(xTrain, yTrain, 'nb', trControl=trainControl(method = 'cv',number=10))

prop.table(table(predict(model$finalModel,xTest)$class,yTest))

## K nearest Neighbor

data_set <- data(iris)
head(iris)
ran <- sample(1:nrow(iris),0.9*nrow(iris))

nor <- function(x) {
  (x-min(x))/(max(x)-min(x))
}

## first we normalize using the formula
iris_norm <- as.data.frame(lapply(iris[c(1,2,3,4)], nor))
summary(iris_norm)

iris_train <- iris_norm[ran,]
head(iris_train)
iris_test <- iris_norm[-ran,]
head(iris_test)

iris_target_category <- iris[ran,5]
iris_target_category

iris_test_category <- iris[-ran,5]
iris_test_category

library(class)

pr <- knn(iris_train, iris_test, cl=iris_target_category,k=13)
tab <- table(pr,iris_test_category)

accuracy <- function(x) {
  sum(diag(x))/(sum(rowSums(x)))*100
}
accuracy(tab)
