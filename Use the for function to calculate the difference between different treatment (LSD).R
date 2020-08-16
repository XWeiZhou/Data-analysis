library(agricolae)

data<-read.csv("Q data .csv",header = T)
data0<-data[,c(1,4,26:28,40:43)]  
data1 <- subset(data0, MBC!="NA", select=c(1:9))   # 

site_list <- list("HL","SY","NC","QY","FJ")   #字符串类型用list,地点列表，要注意不同类型的匹配尤其是字符串和数值型不能混淆。

for (i in 1:5)
{
  data2<-subset(data1,site == site_list[[i]], select=c(1:9))    #site是字符串类型，site_list[[i]]也是字符串类型(用双括号)，才可以用。
  for (j in 1:7) {
    treatment_list <- data2[,c(3:9)]                            #treatment_list是数值型数据框，不能直接用列表list，先要取出想要列的数据。
    oneway <-aov(treatment_list[[j]] ~ incubation_days, data = data2)  #接上，aov函数数据分析的的y和x都是数值型数据，要保持xy数据类型和数量一致。
    LSD <- LSD.test(oneway,"incubation_days",p.adj="bonferroni") 
    mar <-LSD $groups 
    names(mar ) <- c("treatment_index", "groups")              #mar $treatment_indexd代表取出mar 中列名为treatment_index的数据，数据本身列名字为treatment_list[[j]]（一列数据)需要给列重命名  rownamemar <-row.names(mar )
    rownamemar <-as.numeric(row.names(mar )) 
    newmar <-data.frame(rownamemar ,mar $treatment_index, mar $groups) 
    sort <-newmar [order(newmar $rownamemar),]
    rowname <-row.names(LSD $means)              
    mean <-LSD $means[,1]
    sd <-LSD $means[,2]
    marker <-sort $mar.groups
    plotdata <-data.frame(rowname ,mean ,sd ,marker )
    idx_name <- switch(j, "A", "B", "C", "D", "E", "F", "G") #switch条件判断函数,ABCDEFG分别代表不同的指标
    result <- data.frame(site = site_list[[i]], index = idx_name, Treatment=plotdata $rowname ,mean=c(plotdata $mean ),sd=c(plotdata $sd ),marker=plotdata $marker )
    print(result)
    write.table(result , "The difference between different treatment.csv", quote = FALSE,row.names = FALSE,
                col.names = FALSE, append = T)
  }
}
