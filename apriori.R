## Apriori

# we are creating a data frame by importing csv file
mba_data<-read.csv("data_apriori.csv")

## make sure that transactions that are passed to the apriori fn represents a array of transactions 
## each showing multiple item.
trans <- split(mba_data$Products, mba_data$Customer_Id,"transactions") 
head(trans)
# loading arules library
library(arules)
rules = apriori(trans, parameter=list(support=0.5, confidence=0.9,maxlen=3,minlen=2))
# to get the rules
inspect(rules)
