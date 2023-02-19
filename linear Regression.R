data_set<-read.csv("insurance.csv",header=T)
dim(data_set)
summary(data_set)
head(data_set)
data_set$sex<-as.factor(data_set$sex)
data_set$smoker<-as.factor(data_set$smoker)
data_set$region<-as.factor(data_set$region)

data_set<-data_set[sample(nrow(data_set),),]
train_data<-data_set[1:round(dim(data_set)[1]*0.8,0),]
test_data <-data_set[round(dim(data_set)[1]*0.8,0):dim(data_set)[1],]
head(train_data)
head(test_data)
head(data_set)

# dependent value(To be predicted) ~ independent value(s)

fit<-lm(charges~age+sex+bmi+children+smoker+region, data=data_set)
summary(fit)
preds<-predict(fit,newdata=test_data)
df1 <- data.frame(preds,test_data$charges)
head(preds)
cor(preds,test_data$charges)

plot(data_set$age+data_set$sex+data_set$bmi+data_set$children+data_set$smoker+data_set$region, Sacramento$price)
ggplot(fit,aes(data_set$age+data_set$bmi+data_set$children+data_set$charges,charges ))+ 
  geom_point() + 
  stat_smooth(method = lm, se = FALSE) + 
  geom_segment(aes(xend = charges, yend = .fitted), color = "red", size = 0.3)
