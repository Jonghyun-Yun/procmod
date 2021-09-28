mydd = data.frame(y=ytrain, xtrain[, pimp_vv])
set.seed(1)
## pimp_rf_tune <- train(
##   y = ytrain, x =  xtrain[, pimp_vv],
##   method = "ranger",
##   trControl = my_tr,
##   tuneGrid = expand.grid(
##   mtry = c(2,4),
##   splitrule = "variance",
##   min.node.size = c(5,10,15,20)),
##   ## weights = weights,
##   preProc = NULL,
##   importance = "impurity",
##   num.trees = 500)


## to calulate importance p-value based on purmutation
pimp_rf <- ranger(y~.,data = mydd,
                       num.trees = 500, mtry = min(4,ncol(mydd)-1),
  ## importance = "impurity_corrected",
  importance = "permutation",
  ## importance = "hold-out",
  ## importance = "impurity",
  write.forest = TRUE,
  ## probability = TRUE,
  min.node.size = 5,
  class.weights = NULL, splitrule = "variance", classification = FALSE,
  seed = 99
)

vimp = pimp_rf$variable.importance
vimp = data.frame(Name = names(vimp), imp = vimp)
tmp = var %>% filter(Name %in% names(pimp_rf$variable.importance)) %>% select(Name,Label, 'Value scheme') %>% mutate(imp = pimp_rf$variable.importance)
vimp = plyr::join(tmp, vimp)
vimp[,-3]
