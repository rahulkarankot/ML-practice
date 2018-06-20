accident_data <- read.csv("accidents.csv")
accident_data[!complete.cases(accident_data),]
str(accident_data)
summary(accident_data)

head(accident_data)

tail(accident_data)
names(accident_data)
basket_str<- ""

cnames=colnames(accident_data)

for (row in 1:nrow(accident_data)){
  if (row!=1)
  {
    basket_str<- paste0(basket_str,"\n")
  }
  basket_str <- paste0(basket_str,row,",")
  for (col in 2:length(cnames)){
    if(col!=2){
      basket_str<-paste0(basket_str,",")
    }
    basket_str <- paste0(basket_str,cnames[col],"=",accident_data[row,col])
  }
}

write(basket_str,"accidents_basket_1.csv")

accident <- read.transactions("accidents_basket_1.csv",sep=",")
summary(accident)

itemFrequencyPlot(accident,topN=10,type="absolute",col="darkgreen",horiz=TRUE)

itemFrequencyPlot(accident,topN=10)

rules <- apriori(accident,parameter=list(support=0.1,confidence=0.3))

inspect(rules[1:40])

library(arulesViz)
rules2 <- rules[1:50]

plot(rules2)

plot(rules2,method="grouped")

plot(rules2,method="graph")


plot(rules2,method="graph",control=list(type="items"))
