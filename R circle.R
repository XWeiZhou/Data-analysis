##########################Fill data not avaliable for some months#######################################
Climate_data<- read.csv("C:Climate data.csv",header=T)

a<- Climate_data$Value
x<-array(0,dim=c(30,72))
for( i in 1:72) {  
  y <- rnorm(30,a[i],1) 
  x <- array(y,dim=c(30,1))
  print(x)
   i<-i+1} 
x <- array(x,dim=c(30,72))
write.csv(x,file="C:/Users/windows/Desktop/AA.csv")          

