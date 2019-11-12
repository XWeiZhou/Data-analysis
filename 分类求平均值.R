library(dplyr)
Example_data<- read.csv("C:/Example-Groups.csv",header=T)

Example_data_group_means <-  Example_data %>% 
                             dplyr::group_by(Site,Year) %>% 
                             dplyr::summarise(sum=sum(Value),avg=mean(Value),sd=sd(Value))
   