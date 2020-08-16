library(ggplot2)
library(gbm)
data <- read.csv("GBM analysis.csv",header = T)
data_for_importance <- subset(data, D!="NA" & E!="NA", select=c(1:6)) # selcet the data without NA
set.seed(15) 
gbm1 <-  gbm(A ~ B + C + D + E + F,          # formula
             data=data_for_importance,                       # dataset
             # -1: monotone decrease,
             # +1: monotone increase,
             #  0: no monotone restrictions
             var.monotone = c(0, 0, 0, 0, 0),    # the amount of number is equal to the selected factors 
             distribution="gaussian",            # other functions please see the help for other choices
             n.trees = 100,
             interaction.depth = 3, 
             bag.fraction = 0.5,
             shrinkage=0.1,                      # Shrinkage or learning rate,
             train.fraction = 0.5, 
             n.minobsinnode = 0.5,               # minimum total weight needed in each node
             cv.folds = 5,                       # do 5-fold cross-validation
             keep.data=TRUE,                     # keep a copy of the dataset with the object
             verbose=FALSE,                      # don't print out progress
             n.cores=1)                          # use only a single core (detecting #cores is
set.seed(15)
# check performance using 5-fold cross-validation
best.iter <- gbm.perf(gbm1, method = "test")
#print
print(best.iter)
# plot the performance # plot variable influence
summary(gbm1,n.trees=best.iter) # based on the estimated best number of trees
