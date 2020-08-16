library(ggplot2)
library(customLayout)
# 创建拼图画布
lay1 <- lay_new( mat = matrix(1:4, ncol = 2), 
# 矩阵分布，mat表示指定排版的数字矩阵 
widths = c(3,2),     # 设定宽度比例          

heights = c(2,1))   # 设置高度比例)# 显示拼图画布lay_show(lay1)         
lay_show(lay1)

# 创建第2个拼图画布，与第1个结构一样，只是比例不一样
lay2 <- lay_new( matrix(1:4, nc = 2), widths = c(3, 5),heights = c(2, 4))
lay_show(lay2)


######其它拼图包没有的功能，非常好用
###跟合并矩阵类似。分为行合并和列合并

####lay_bind_col() 画布列合并
####lay_bind_col(x, y, widths = c(1, 1), addmax = TRUE) 参数widths表示指定合并宽度比
####lay_bind_row() 画布行合并
####lay_bind_row(x, y, heights = c(1, 1), addmax = TRUE) 参数heights表示指定合并高度比################################################
##参数lay表示大画布，参数newlay表示要嵌套进去的小画布，field表示指定要嵌套的区域编号#####
cl_1 <- lay_bind_col(lay1, lay2, widths = c(3, 1))  
# 指定合并宽度比为3:1
lay_show(cl_1)# 画布行合并
cl_2 <- lay_bind_row(lay1, lay2, heights = c(3, 1))  
# 指定合并高度比为3:1
lay_show(cl_2)# 多次合并
lay_show(lay_bind_col(cl_1, cl_2, widths = c(2:1)))


######lay_split_field(lay, newlay, field)################################################
##参数lay表示大画布，参数newlay表示要嵌套进去的小画布，field表示指定要嵌套的区域编号#####
slay <- lay_split_field(lay1, lay2, field = 1)  
# 将画布lay2嵌套进lay1的第1个区域，即左上角格子
lay_show(slay)

#########################1.5 填充图片################################################
#####关键函数：lay_set(layout) 将画布layout设置为绘图布局，用于base绘图对象##########
#####lay_grid(grobs, lay, ...) 将绘图对象grobs填充到画布lay中， 用于ggplot2等绘图对象###############################################################
library(ggplot2)
library(customLayout)
par(mar = c(3, 2, 2, 1)) # 设定页边距# 创建排版画布
lay1  <- lay_new(   
  matrix(1:4, nc = 2), # 2行2列布局画布
  widths = c(3, 2),  heights = c(2, 1))
lay2 <- lay_new(matrix(1:3)) # 3行1列布局画布
cl <- lay_bind_col(lay1, lay2, widths = c(3, 1)) 
# 画布列合并
lay_show(cl)
lay_set(cl) 
# 设定绘图对象布局 
set.seed(123)# 绘图填充
plot(1:100 + rnorm(100)) # 填充到画布第1格
plot(rnorm(100), type = "l") # 填充到画布第2格
hist(rnorm(500))
acf(rnorm(100)) # 填充到画布第4格
pie(c(3, 4, 6), col = 2:4)
pie(c(3, 2, 7), col = 2:4 + 3)
pie(c(5, 4, 2), col = 2:4 + 6)


######################### ggplot2绘图对象填充################################################
library(ggplot2)
library(customLayout)
library(gridExtra)# 创建排版画布
lay1 <- lay_new(matrix(1:2, ncol = 1))  # 2行1列画布
lay2 <- lay_new(matrix(1:3))  # 3行1列画布
cl <- lay_bind_col(lay1, lay2, widths = c(3, 1))  # 画布列合并
# 创建数据
cuts <- sort(unique(diamonds[["cut"]]), decreasing = TRUE)
make_cut_plot <- function(cut) {
  dd <- diamonds[cut == diamonds[["cut"]], ]  # 
  ggplot(dd) + 
    geom_point(aes(carat, price)) + 
    facet_wrap("cut")  
  }
# 封装分面
  plots <- lapply(cuts, make_cut_plot)  
  # 对不同切割水平的进行作图
  lay_grid(plots, cl)  
  # 将绘图对象依次填充到cl画布中

  
 ################################################################################################### 
  ##cowplot是一个ggplot2包的简单补充，意味着其可以为ggplot2提供出版物级的主题等。###################
  ##更重要的是，这个包可以组合多个”ggplot2”绘制的图为一个图，并且为每个图加上例如A,B,C等标签################，
   ##这在具体的出版物上通常是要求的。 语法结构与ggplot类似，将ggplot2图作为一个对象置于ggdraw()中 ################ 
 ####表达式： raw_plot(plot, x = 0, y = 0, width = 1, height = 1, scale = 1)
 #### draw_text(text, x = 0.5, y = 0.5, size = 14, hjust = 0.5, vjust = 0.5,...)
 #### draw_plot_label(label, x = 0, y = 1, hjust = -0.5, vjust = 1.5, size = 16, fontface = "bold", family = NULL, colour = NULL, ...)参数解释：
  
 ## plot 表示ggplot2绘图对象########
  ##x, y 表示子图的起点坐标(左下角坐标)，在0-1之间，表示占母图的比例，########
  ##width, height 表示子图长宽所占比例，在0-1之间########
  ##text 表示要映射的文本向量########
  ##label 表示要映射的文本向量########
  ##其它参数与ggplot2中意思一样#########
  library(ggplot2)
  library(cowplot)
  library(showtext)
  font_add_google("Dancing Script", "Dancing")
  
  plot.iris <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) +     
    geom_point() + 
    facet_grid(cols = vars(Species)) 
  # 按Species列分面
  
  plot.mpg <- ggplot(mpg, aes(x = cty, y = hwy, colour = factor(cyl))) +   
    geom_point(size = 2.5) +    
    labs(title = "dot plot") 
  
  plot.diamonds <- ggplot(diamonds, aes(clarity, fill = cut)) +   
    geom_bar() +   
    theme(axis.text.x = element_text(angle = 70, vjust = 0.5)) +   
    labs(title = "bar plot")
  
  gg <- ggdraw() +     
    draw_plot(plot.iris, 0, 0.5, 1, 0.5) + # 在母图上半部，占母图比例1/2  
    draw_plot(plot.mpg, 0, 0, 0.5, 0.5) + # 在母图左下角，占母图比例1/4  
    draw_plot(plot.diamonds, 0.5, 0, 0.5, 0.5) + # 在母图右下角，占母图比例1/4 
    draw_plot_label(c("A", "B", "C"), c(0, 0, 0.5), c(1, 0.5, 0.5), size = 15, colour = "cyan", family = "Dancing") # 加上标签，
  showtext_begin()
  print(gg)
  showtext_end()  
  
  
  
  