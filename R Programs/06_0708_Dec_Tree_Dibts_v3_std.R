

getwd()

setwd("E:\\Locker\\Sai\\SaiHCourseNait\\DecBtch\\R_Datasets")

getwd()

# loading libraries 
install.packages("tree")
install.packages("party")
install.packages("partykit")
install.packages("rpart")
install.packages("rpart.plot")
install.packages("randomForest")
install.packages("caret")

library(tree) 
library(party) 
library(rpart) # Popular decision tree algorithm
library(rpart.plot) # Enhanced tree plots
library(party) # Alternative decision tree algorithm
library(partykit)
library(caret)
library(randomForest)

#install.packages("caret")
Cart_data <- read.csv("CART-Example.csv")

str(Cart_data)

?rpart


Cart_Model <- rpart(Weight~Height, Cart_data, method = "anova",
                    control=rpart.control(minsplit=6, 
                                          minbucket =3, 
                                          maxdepth=2))
plot(as.party(Cart_Model))
print(Cart_Model)
summary(Cart_Model)
rsq.rpart(Cart_Model)
#***
# creating a tree using tree package 
dataSUps <- read.csv("50-Startups.csv")

head(dataSUps)

treeSUps <- tree(Profit ~., data=dataSUps) 
plot(treeSUps) 
text(treeSUps) 

cart_model <- rpart(Profit~., data=dataSUps)
plot(as.party(cart_model))
print(cart_model)
summary(cart_model)
rsq.rpart(cart_model)
#***
cart_model <- rpart(Profit~Administration, data=dataSUps)
plot(as.party(cart_model))
rsq.rpart(cart_model)

cart_model <- rpart(Profit~Administration+State, data=dataSUps)
plot(as.party(cart_model))
rsq.rpart(cart_model)

cart_model <- rpart(Profit~R.D.Spend+State, data=dataSUps)
plot(as.party(cart_model))
rsq.rpart(cart_model)

rpart.plot(cart_model)
rpart.plot(cart_model,extra=1)
?rpart.plot

?rpart
fit_1<- rpart(Profit~State, method="class",data=dataSUps)
plot(as.party(fit_1))
rsq.rpart(fit_1)

fit_1<- rpart(Profit~State+R.D.Spend, method="class",data=dataSUps)
plot(as.party(fit_1))

rpart.plot(fit_1)
rpart.plot(fit_1,extra=1)
rpart.plot(fit_1,extra=2)
rpart.plot(fit_1,extra=3)
rpart.plot(fit_1,extra=4)
rpart.plot(fit_1,extra=101)
?rpart.plot


treeSUps <- tree(Profit ~Administration, data=dataSUps) 
plot(treeSUps) 
text(treeSUps) 

treeSUps <- tree(Profit ~Administration+Marketing.Spend, data=dataSUps) 
plot(treeSUps) 
text(treeSUps) 

treeSUps <- tree(Profit ~Administration+Marketing.Spend+R.D.Spend, data=dataSUps) 
plot(treeSUps) 
text(treeSUps) 

treeSUps <- tree(Profit ~Administration+Marketing.Spend+R.D.Spend+State, data=dataSUps) 
plot(treeSUps) 
text(treeSUps) 

treeSUps
summary(treeSUps)
print(treeSUps$cptable)

#***

DB<-read.csv("Diabetes.csv",head=T)

head(DB)

nrow(DB)

set.seed(1234)
sample(letters)

head(DB)

set.seed(2)
DB$ind<-sample(2,nrow(DB),replace=TRUE,prob=c(0.7,0.3))

head(DB$ind)

head(DB)


trainData<-DB[(DB$ind==1),]
head(trainData)
testData<-DB[(DB$ind==2),]

nrow(trainData)
nrow(testData)

#library(rpart)

head(trainData)
dt<-rpart(Class.variable~., 
          data=trainData,
          control=rpart.control(minsplit=10))
dt

plot(dt)
text(dt)


dt<-rpart(Class.variable~., 
          data=trainData,
          control=rpart.control(minsplit=1))
dt
plot(dt)
text(dt)


str(trainData)

dt<-rpart(Class.variable~Number.of.times.pregnant
          +Plasma.glucose.concentration
          +Diastolic.blood.pressure
          +Triceps.skin.fold.thickness
          +X2.Hour.serum.insulin
          +Body.mass.index
          +Diabetes.pedigree.function
          +Age..years., 
          data=trainData,
          control=rpart.control(minsplit=20))

dt
plot(dt)
text(dt)

####Predict####
pred<-predict(dt,testData,type=c("class"))
pred

View(cbind(as.character(testData$Class.variable),as.character(pred)))

#####confusion matrix######
t = table(as.character(testData$Class.variable),as.character(pred))
t
sum(diag(t))/sum(t)
(127+55)/(127+55+25+29)

####Predict-Prob#####
pred1<-predict(dt,testData,type=c("prob"))
pred1

head(pred)
head(pred1)



#####New Prediction######

New<-read.csv("Diabetes-New.csv",head=T)
head(New)
predict(dt,New,type=c("prob"))


attributes(dt)

dt$variable.importance

dt<-rpart(Class.variable~Number.of.times.pregnant
          +Plasma.glucose.concentration
          +Diastolic.blood.pressure
          +X2.Hour.serum.insulin, 
          data=trainData,
          control=rpart.control(minsplit=20))

dt
plot(dt)
text(dt)
####Predict####
pred<-predict(dt,testData,type=c("class"))
pred

cbind(as.character(testData$Class.variable),as.character(pred))

#####confusion matrix######
table(as.character(testData$Class.variable),as.character(pred))
(128+48)/(128+48+24+36)

dt$variable.importance


dt<-rpart(Class.variable~Number.of.times.pregnant
          +Plasma.glucose.concentration
          +Diastolic.blood.pressure, 
          data=trainData,
          control=rpart.control(minsplit=20))
####Predict####
pred<-predict(dt,testData,type=c("class"))
cbind(as.character(testData$Class.variable),as.character(pred))
#####confusion matrix######
table(as.character(testData$Class.variable),as.character(pred))
(128+50)/(128+50+24+34)


dt<-rpart(Class.variable~., 
          data=trainData,
          control=rpart.control(minsplit=20))
dt$variable.importance

#*** No BP & NO Pregnant
dt<-rpart(Class.variable~
            Plasma.glucose.concentration
          +X2.Hour.serum.insulin, 
          data=trainData,
          control=rpart.control(minsplit=20))
pred<-predict(dt,testData,type=c("class"))
table(as.character(testData$Class.variable),as.character(pred))
(142+32)/(142+10+52+32)


#*** No BP & NO Pregnant & No Insulin
dt<-rpart(Class.variable~Plasma.glucose.concentration,
          data=trainData,
          control=rpart.control(minsplit=20))

####Predict####
pred<-predict(dt,testData,type=c("class"))

#####confusion matrix######
table(as.character(testData$Class.variable),as.character(pred))
(142+32)/(142+10+52+32)

#***

data <- iris
head(data)

tail(data)

summary(data)

str(data)

library(ggplot2)

qplot(data$Petal.Length, data$Petal.Width, data, colour=data$Species,size=3)

attach(data)

qplot(Petal.Length, Petal.Width, data, colour=data$Species,size=3)

qplot(Sepal.Length, Sepal.Width, data, colour=Species, size=3)

par(mfrow=c(2,2))
boxplot( Petal.Length ~ Species, data,col="red")
title("Petal Length")
boxplot( Petal.Width ~ Species, data,col="green")
title("Petal Width")
boxplot( Sepal.Length ~ Species, data,col="blue")
title("Sepal Length")
boxplot( Sepal.Width ~ Species, data,col="maroon")
title("Sepal Width")

par(mfrow=c(1,1))
install.packages("psych")
library(psych)

pairs.panels(data)

install.packages("caret")
library(caret)
?createDataPartition
inTrain <- createDataPartition(y=data$Species ,p=0.7,list=FALSE)

training <- data[inTrain,]

testing <- data[-inTrain,]

dim(training);
dim(testing)

install.packages("C50")
library(C50)

View(training[-5])
str(training)

?C5.0

model <- C5.0(training[-5], training$Species)

summary(model)

library(caret)

predicted <- predict(model, testing)

table(predicted)

install.packages("e1071")

confusionMatrix(predicted, testing$Species)
#*** Iter 2 ***


#***
data <- iris
attach(data)
inTrain <- createDataPartition(y=data$Species ,p=0.6,list=FALSE)
training <- data[inTrain,]
testing <- data[-inTrain,]
model <- C5.0(training[-5], training$Species)
predicted <- predict(model, testing)
confusionMatrix(predicted, testing$Species)

