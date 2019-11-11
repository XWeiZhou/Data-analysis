############################## 多列转换成几个列代码for Erguna##########
file <- "H:/硕士文件/老师和师兄发送文件保存/徐翀师兄文件/20190409整理EDGE ANPP数据/txt/Erguna.csv"   ####set the file path and rerd file
Mydata <- read.csv(file )         ####to  rerd csv file                                                                                                                           

Mydata <- Mydata[,8:71]           ####to record all the needed column information[different csv may have different column ,so it is important to set this].
row.names(Mydata) <- Mydata[,1]   ####set the first column as the rowname

New_Mydata <- Mydata[,-1]         ####delet the first column
colnames(New_Mydata)
rownames(New_Mydata)

New_Mydata <- as.matrix(New_Mydata)####it is very important to set csv as matrix
class(New_Mydata)
str(New_Mydata)

Erguna <- data.frame(date=rep(rownames(New_Mydata),ncol(New_Mydata)),
                taxa =rep(colnames(New_Mydata),each=nrow(New_Mydata)),
                 cover=as.vector(New_Mydata))
Erguna
write.csv(Erguna,file="H:/硕士文件/老师和师兄发送文件保存/徐翀师兄文件/20190409整理EDGE ANPP数据/Erguna1.csv")

#######################################Sheila MuRen.csv############
file <- "H:/硕士文件/老师和师兄发送文件保存/徐翀师兄文件/20190409整理EDGE ANPP数据/txt/Sheila MuRen.csv"
Mydata <- read.csv(file )

Mydata <- Mydata[,8:60]
row.names(Mydata) <- Mydata[,1]

New_Mydata <- Mydata[,-1]
colnames(New_Mydata)
rownames(New_Mydata)

New_Mydata <- as.matrix(New_Mydata)
class(New_Mydata)
str(New_Mydata)

Sheila_MuRen <- data.frame(date=rep(rownames(New_Mydata),ncol(New_Mydata)),
                     taxa =rep(colnames(New_Mydata),each=nrow(New_Mydata)),
                     cover=as.vector(New_Mydata))
Sheila_MuRen
write.csv(Sheila_MuRen ,file="H:/硕士文件/老师和师兄发送文件保存/徐翀师兄文件/20190409整理EDGE ANPP数据/Sheila_MuRen1.csv")

############################################################################################################
file <- "H:/硕士文件/老师和师兄发送文件保存/徐翀师兄文件/20190409整理EDGE ANPP数据/txt/Sher Tara.csv"
Mydata <- read.csv(file )

Mydata <- Mydata[,8:60]
row.names(Mydata) <- Mydata[,1]

New_Mydata <- Mydata[,-1]
colnames(New_Mydata)
rownames(New_Mydata)

New_Mydata <- as.matrix(New_Mydata)
class(New_Mydata)
str(New_Mydata)

Sher_Tara <- data.frame(date=rep(rownames(New_Mydata),ncol(New_Mydata)),
                           taxa =rep(colnames(New_Mydata),each=nrow(New_Mydata)),
                           cover=as.vector(New_Mydata))
Sher_Tara
write.csv(Sher_Tara ,file="H:/硕士文件/老师和师兄发送文件保存/徐翀师兄文件/20190409整理EDGE ANPP数据/Sher_Tara1.csv")

###########################################################################################################
file <- "H:/硕士文件/老师和师兄发送文件保存/徐翀师兄文件/20190409整理EDGE ANPP数据/txt/Urat.csv"
Mydata <- read.csv(file )

Mydata <- Mydata[,8:39]
row.names(Mydata) <- Mydata[,1]

New_Mydata <- Mydata[,-1]
colnames(New_Mydata)
rownames(New_Mydata)

New_Mydata <- as.matrix(New_Mydata)
class(New_Mydata)
str(New_Mydata)

Urat <- data.frame(date=rep(rownames(New_Mydata),ncol(New_Mydata)),
                        taxa =rep(colnames(New_Mydata),each=nrow(New_Mydata)),
                        cover=as.vector(New_Mydata))
Urat
write.csv(Urat ,file="H:/硕士文件/老师和师兄发送文件保存/徐翀师兄文件/20190409整理EDGE ANPP数据/Urat1.csv")

###################################################################################################
file <- "H:/硕士文件/老师和师兄发送文件保存/徐翀师兄文件/20190409整理EDGE ANPP数据/txt/Xilinhot-Leymus chinensis.csv"
Mydata <- read.csv(file )

Mydata <- Mydata[,8:43]
row.names(Mydata) <- Mydata[,1]

New_Mydata <- Mydata[,-1]
colnames(New_Mydata)
rownames(New_Mydata)

New_Mydata <- as.matrix(New_Mydata)
class(New_Mydata)
str(New_Mydata)

Xilinhot_Leymus_chinensis <- data.frame(date=rep(rownames(New_Mydata),ncol(New_Mydata)),
                   taxa =rep(colnames(New_Mydata),each=nrow(New_Mydata)),
                   cover=as.vector(New_Mydata))
Xilinhot_Leymus_chinensis
write.csv(Xilinhot_Leymus_chinensis ,file="H:/硕士文件/老师和师兄发送文件保存/徐翀师兄文件/20190409整理EDGE ANPP数据/Xilinhot-Leymus_chinensis2.csv")

###################################################################################################
file <- "H:/硕士文件/老师和师兄发送文件保存/徐翀师兄文件/20190409整理EDGE ANPP数据/txt/Xilinhot-Stipa grandis.csv"
Mydata <- read.csv(file )

Mydata <- Mydata[,8:44]
row.names(Mydata) <- Mydata[,1]

New_Mydata <- Mydata[,-1]
colnames(New_Mydata)
rownames(New_Mydata)

New_Mydata <- as.matrix(New_Mydata)
class(New_Mydata)
str(New_Mydata)

Xilinhot_Stipa_grandis <- data.frame(date=rep(rownames(New_Mydata),ncol(New_Mydata)),
                                        taxa =rep(colnames(New_Mydata),each=nrow(New_Mydata)),
                                        cover=as.vector(New_Mydata))
Xilinhot_Stipa_grandis
write.csv(Xilinhot_Stipa_grandis ,file="H:/硕士文件/老师和师兄发送文件保存/徐翀师兄文件/20190409整理EDGE ANPP数据/Xilinhot_Stipa_grandis1.csv")




################################例子####################
m = cbind(c(1,2,3),c(4,5,6),c(7,8,9))
row.names(m) = c('R1','R2','R3')
rownames(m)
colnames(m) = c('C1','C2','C3')
colnames(m)
class(m)
str(m)
m
d <- data.frame(i=rep(rownames(m),ncol(m)),
                j=rep(colnames(m),each=nrow(m)),
                score=as.vector(m))
d
