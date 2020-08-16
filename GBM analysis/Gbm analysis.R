library(ggplot2)
library(gbm)
mtcars<-read.csv("C:/Users/David Zhou/Desktop/JXT_INON_20200602.csv",header = T)
data_RF<-subset(mtcars, NO!="NA" & NH!="NA", select=c(1:6))
set.seed(15) 
gbm1 <-  gbm(Richness ~ Litter.biomass + pH + NO + NH + PAR,          # formula
             data=data_RF,                   # dataset
             # -1: monotone decrease,
             # +1: monotone increase,
             #  0: no monotone restrictions
             var.monotone = c(0, 0, 0, 0, 0),
             distribution="gaussian",     # see the help for other choices
             n.trees = 100,
             interaction.depth = 3, 
             bag.fraction = 0.5,
             shrinkage=0.1,                     # shrinkage or learning rate,
             train.fraction = 0.5, 
             n.minobsinnode = 0.5,         # minimum total weight needed in each node
             cv.folds = 5,                 # do 5-fold cross-validation
             keep.data=TRUE,              # keep a copy of the dataset with the object
             verbose=FALSE,              # don't print out progress
             n.cores=1)                        # use only a single core (detecting #cores is

# error-prone, so avoided here)
set.seed(15)
# check performance using 5-fold cross-validation
best.iter <- gbm.perf(gbm1, method = "test")
print(best.iter)
# plot the performance # plot variable influence
summary(gbm1,n.trees=best.iter) # based on the estimated best number of trees

