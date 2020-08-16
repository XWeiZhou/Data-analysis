#批量读入数据并合并为一个文件
#在当前工作目录是下新建一个文件夹叫"myname"
#把要读入的数据存储在myname文件夹里面，这里只能是1层不能再有下一层文件夹
#先用dir()函数获取目录中的文件名
doc.names <- dir("myname")
#更改工作目录至"myname"下面
setwd("./myname")

#确定读入文件的个数
n=length(doc.names)
#首先读入第一个文件
a=read.table(doc.names[1],header=T)
#然后读入后面的文件并与前面的文件行合并
for (i in 2:n){a=rbind(a,read.table(doc.names[i],header=T))}
#a就是你要的文件
a

