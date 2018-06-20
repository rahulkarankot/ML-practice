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


