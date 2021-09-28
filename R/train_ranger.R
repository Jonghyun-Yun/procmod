xtrain <- model.matrix(~ 0 + ., data = dx)
ytrain <- y
weights <- rep(1, length(y)) / length(y)

set.seed(1)
nfold <- 4
shu <- sample(1:length(ytrain))
xtrain <- xtrain[shu, ]
ytrain <- ytrain[shu]
data_folds <- caret::createFolds(ytrain, k = nfold)

## imputation needs for ranger
## ixtrain <- xtrain
## ixtrain[is.na(ixtrain)] <- -99

## above50k needs to be "positive"
## caret considers 1st class as "positive" class
## fytrain <- factor(ytrain)
## levels(fytrain) <- c("no_cor", "cor")
