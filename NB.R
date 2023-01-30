library(naivebayes)

data = read.csv("penguins_size.csv")

xtabs (~ species, data = data)

idx = sample(2, 344, replace = TRUE, prob = c(0.7, 0.3))

train = data[idx == 1,]
test = data[idx == 2,]

train
test

data = data[, -2]

model = naive_bayes(species ~ ., data = train, usekernel = T)

plot(model)

p = predict(model, test)

cf = table(p, test$species)

sum(diag(cf)/sum(cf))

cf

p = predict(model, train)
cf = table(p, train$species)

cat("Dokładność: ", sum(diag(cf))/sum(cf)*100, "%")