Fer_input <-read.csv(file ="H:/fertilizerinput-data/NP11.csv",header = T ) 
names(Fer_input)
N_input <- Fer_input[,7]
P_input <- Fer_input[,8]
N_input_log <-  Fer_input[,9]
P_input_log <-  Fer_input[,10]
ks.test(N_input,pnorm)
ks.test(P_input,pnorm)
ks.test(N_input_log,pnorm)
ks.test(P_input_log,pnorm)
library(customLayout)
par(mar = c(3, 2, 2, 1)) # 设定页边距# 创建排版画布
lay1  <- lay_new(   
  matrix(1:4, nc = 2), # 2行2列布局画布
  widths = c(3, 3),  heights = c(3, 3))
lay_show(lay1)
lay_set(lay1) 
hist(N_input)
hist(N_input_log)
hist(P_input)
hist(P_input_log)


