my_tr <- trainControl(
  method = "cv",
  number = nfold,
  ## classProbs = TRUE,
  savePredictions = "all",
  ## summaryFunction = twoClassSummary, # AUC
  ## ,summaryFunction = prSummary # PR-AUC
  ## ,summaryFunction = fSummary # F1
  ## summaryFunction = mnLogLoss,
  search = "random",
  verboseIter = TRUE,
  allowParallel = TRUE,
  indexOut = data_folds
)

ranger_grid <- expand.grid(
  mtry = c(5,10,15,20,25,30),
  splitrule = "variance",
  min.node.size = c(5,10,15,20)
)

set.seed(1)
ranger_tune <- train(
  x = xtrain, y = ytrain,
  method = "ranger",
  trControl = my_tr,
  tuneGrid = ranger_grid,
  preProc = NULL,
  importance = "impurity",
  num.trees = 500)

temp <- ranger_tune$pred$co
ranger_id <- ranger_tune$pred$rowIndex
ranger_prob <- temp[order(ranger_id)]
ranger_final <- ranger_tune$finalModel
ranger_imp <- varImp(ranger_tune)$importance
