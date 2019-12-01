# library
library(ggplot2)

data<-read.table("kook3.txt",header=T)   
# Custom Binning. I can just give the size of the bin

p3<-ggplot(data, aes(x=DR,y=..density..)) + 
  geom_histogram(binwidth = 0.1, aes(fill = ..count..) )+
  geom_density(color=NA)+
  geom_line(stat = "density",color="red")+
  labs(y="Density")

ggsave("k1.pdf", width = 12, height= 10, units = "cm")
ggsave("k1.png", width = 12, height= 10, units = "cm")

p4<-ggplot(data, aes(x=DR,y=..density..)) + 
  geom_histogram(binwidth = 0.1, fill="white",color="black")+
  geom_density(color=NA)+
  geom_line(stat = "density",color="red")+
  labs(y="Density")

ggsave("k2.pdf", width = 10, height= 10, units = "cm")
ggsave("k2.png", width = 10, height= 10, units = "cm")