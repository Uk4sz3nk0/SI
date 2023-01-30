library(rpart)
library(rattle)

data = read.csv("penguins_size.csv",header = TRUE, stringsAsFactors = T)

idx=sample(2,344,replace = T, prob=c(0.7,0.3))

train = data[idx == 1,]
test = data[idx ==2,]

model = rpart(species ~ . , data=train)

fancyRpartPlot(model)
#plot(model)

p = predict(model, test, type = "class")
length(p)
p
test$species
length(data$species)
cf = table (p, test$species)
cf


cat("Dokładność: ", sum(diag(cf))/sum(cf)*100, "%")