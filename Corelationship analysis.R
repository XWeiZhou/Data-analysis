library(corrplot)
mtcars<-read.csv("zwmcor.csv",header = T)
mtcars1<-mtcars[,-(1:5)]
M <- cor(mtcars1)
col <- colorRampPalette(c("#053061","#2166AC" , "#4393C3", "#92C5DE",
                          "#D1E5F0", "#FFFFFF","#FDDBC7" ,"#F4A582" ,
                          "#D6604D","#B2182B" ,"#67001F" ))(200)## set color 
par(ask=F)
png("Corelationship between AC PC and other propiets.png",width=6*ppi,height=6*ppi,res = ppi) #set output picture size and ppi
# mat : is a matrix of data
# ... : further arguments to pass to the native R cor.test function
cor.mtest <- function(mat, ...) {
  mat <- as.matrix(mat)
  n <- ncol(mat)
  p.mat<- matrix(NA, n, n)
  diag(p.mat) <- 0
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      tmp <- cor.test(mat[, i], mat[, j], ...)
      p.mat[i, j] <- p.mat[j, i] <- tmp$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  p.mat
}
p.mat <- cor.mtest(mtcars1)     # matrix of the p-value of the correlation

p <- corrplot(M, type="upper", order="hclust", tl.col="black",col=col,#Text label color
              p.mat = p.mat, sig.level = 0.05)   ## Specialized the insignificant value according to the significant level

print(p)
dev.off()