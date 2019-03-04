data("iris")
iris
str(iris)
plot(iris)
library(ggplot2)

qplot(Petal.Length,Petal.Width,data=iris,color=Species)
#SVM
#install.packages("e1071")
library(e1071)
svm_model<-svm(Species~.,data=iris,kernel="radial")
summary(svm_model)
plot(svm_model,data=iris,Petal.Width~Petal.Length,slice=list(Sepal.Width=3,Sepal.Length=4))

# Tuning
set.seed(123)
tun_svm<-tune(svm,Species~.,data=iris,ranges = list(epsilon=seq(0,1,0.1),cost=2^(2:7)))
plot(tun_svm)
summary(tun_svm)
#Confusion Matrix ans Miscassification Error
prediction<-predict(svm_model,iris)
con_table<-table(prediction,iris$Species)
con_table
1-sum(diag(con_table))/sum(con_table)

