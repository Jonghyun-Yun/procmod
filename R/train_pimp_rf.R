set.seed(9999)
mydd = data.frame(y=ytrain, xtrain)

## to calulate importance p-value based on purmutation
ranger_ff <- ranger(y~.,data = mydd,
                       num.trees = 500, mtry = 30,
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

## ranger_ho <- holdoutRF(y~.,data = mydd,
##                        num.trees = 500, mtry = 30,
##   ## importance = "impurity_corrected",
##   ## importance = "permutation",
##   ## importance = "hold-out",
##   ## importance = "impurity",
##   write.forest = TRUE,
##   ## probability = TRUE,
##   min.node.size = 5,
##   class.weights = NULL, splitrule = "variance", classification = FALSE,
##   seed = 99
## )

ranger_imp <- ranger_ff$variable.importance
rtemp <- data.frame(ranger_imp = ranger_imp)
row.names(rtemp) <- names(ranger_imp)
rrtemp <- rtemp %>%
  arrange(-ranger_imp) # %>% slice(1:15)
rrtemp[,1] = rrtemp[,1] / rrtemp[1,1] * 100
vimp = g10 = rrtemp %>% filter(ranger_imp > 25)
vimp = data.frame(Name = row.names(vimp), imp = vimp)
tmp = var %>% filter(Name %in% vimp$Name) %>% select(Name,Label, 'Value scheme') 
vimp = plyr::join(tmp, vimp)
vimp[,-3]
g10 = vimp %>% filter(!(Name %in% c("AGEG10LFS","AGEG10LFS_T"))) %>% select(Name, ranger_imp)

set.seed(9999)
mydd = mydd %>% select(y, g10$Name)
ranger_ff <- ranger(y~.,data = mydd,
                       num.trees = 500, mtry = min(10,nrow(g10)),
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

im_pp = importance_pvalues(ranger_ff, method = "altmann", formula = y ~ ., data = mydd,
                                  num.permutations = 100)

imp = data.frame(Name = row.names(im_pp), imp = im_pp[,1], pval = im_pp[,2])
tmp = var %>% filter(Name %in% imp$Name) %>% select(Name, Label, 'Value scheme')
imp = plyr::join(tmp, imp) %>% arrange(pval)
imp[,-3]

pimp = sort(im_pp[,2])
pimp[pimp < 0.05] %>% knitr::kable()
pimp_vv = names(pimp)[pimp < 0.05]
