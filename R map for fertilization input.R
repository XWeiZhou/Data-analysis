rm(list = ls()); gc() # 清空内存
library(ggplot2)
library("sf")
library("magrittr")
library("rgdal")
library(ggmap)
library(maps)
library("dplyr")
library("leaflet")
library("maptools")

# 读取各省中心点坐标数据
path1 <- "G:/R train/R-map-data/prov_centroids.csv"
Prov_centers <- read.csv(path1, stringsAsFactors = FALSE)
str(Prov_centers)

# 读取地图坐标数据
path2 <- "G:/R train/R-map-data/JSON/GeoJSON/China.geojson"
China_1 <-st_read(path2, stringsAsFactors = FALSE)
str(China_1)
class(China_1)
class(China_1$geometry)

# fertilization data
mydata_1 <- read.csv("H:fertilization input.csv",header=T,stringsAsFactors=FALSE)
str(mydata_1)
class(mydata_1)

# combine data
mydata_2 <- left_join(Prov_centers, mydata_1, by = "name")
mydata_3 <- left_join(China_1, mydata_2, by = "name")

# make graph
p1<-ggplot(mydata_3) + 
  geom_sf(aes(fill = TF) ) +
  coord_sf() + 
  scale_fill_continuous(low = 'yellowgreen',high ='red2', guide = "colorbar")+ # 调整颜色标度
  ggtitle("Total Input")

p2<-ggplot(mydata_3) + 
  geom_sf(aes(fill = N) ) +
  coord_sf() + 
  scale_fill_continuous(low = 'yellowgreen',high ='red2', guide = "colorbar")+ # 调整颜色标度
  ggtitle("Nitrogen Input")
      
p3<-ggplot(mydata_3) + 
  geom_sf(aes(fill = P) ) +
  coord_sf() + 
  scale_fill_continuous(low = 'yellowgreen',high ='red2', guide = "colorbar")+ # 调整颜色标度
  ggtitle("Phosphorus Input")

p4<-ggplot(mydata_3) + 
  geom_sf(aes(fill = K) ) +
  coord_sf() + 
  scale_fill_continuous(low = 'yellowgreen',high ='red2', guide = "colorbar")+ # 调整颜色标度
  ggtitle("Potassium  Input")

library(cowplot)
library(showtext)
gg <- ggdraw() +     
  draw_plot(p1, 0, 0.5, 0.5, 0.5) + # 在母图上半部，占母图比例1/2  
  draw_plot(p2, 0.5, 0.5, 0.5, 0.5) + # 在母图上半部角，占母图比例1/2
  draw_plot(p3, 0, 0, 0.5, 0.5) + # 在母图上半部角，占母图比例1/2  
  draw_plot(p4, 0.5, 0, 0.5, 0.5)  # 在母图上半部角，占母图比例1/2  
  print(gg)
ggsave("Fertilizer input.pdf", width = 25, height= 25, units = "cm")
ggsave("Fertilizer input.png", width = 25, height= 25, units = "cm")
dev.off()

