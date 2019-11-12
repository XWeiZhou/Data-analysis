############################## 多列转换成几个列代码for Erguna##########
file <- "H:/txt1.csv"   ####set the file path and rerd file
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
write.csv(Erguna,file="H:/EN1.csv")

#######################################Sheila MuRen.csv############
file <- "H:/txt2.csv"
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
write.csv(Sheila_MuRen ,file="H:/EN2.csv")

############################################################################################################
file <- "H:/txt3.csv"
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
write.csv(Sher_Tara ,file="H:/EN3.csv")

###########################################################################################################
file <- "H:/tx4.csv"
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
write.csv(Urat ,file="H:/EN4.csv")

###################################################################################################
file <- "H:/txt5.csv"
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
write.csv(Xilinhot_Leymus_chinensis ,file="H:/EN5.csv")

###################################################################################################
file <- "H:/txt6.csv"
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
write.csv(Xilinhot_Stipa_grandis ,file="H:/EN6.csv")