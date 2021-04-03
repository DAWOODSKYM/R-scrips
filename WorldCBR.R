#load the required libraries
library(sf)
library(RColorBrewer)
library(tmap)
library(dplyr)
library(mapview)
#Read the shapefile and csv and print their coloumns names
SA<-st_read("world2/World_Countries.shp")
cols<-names(SA)
Data<-read.csv("SA4.csv")
print(Data)
#names(Data)[COUNTRY]="XCOUNTRY"
#Join csv to shapefile
Datajoin<-left_join(SA,Data,by=c('COUNTRY'='ï..COUNTRY'))
#set view mode and print
map1<-tm_shape(Datajoin)+tm_polygons("X1960",palette="Reds",contrast=1)+tm_layout(legend.frame="Red",title="David M. ENC222-0131/2018")
map2<-tm_shape(Datajoin)+tm_polygons("X1990",palette="Reds",contrast=1)+tm_layout(legend.frame="Red",title="David M. ENC222-0131/2018")
map3<-tm_shape(Datajoin)+tm_polygons("X2000",palette="Reds",contrast=1)+tm_layout(legend.frame="Red",title="David M. ENC222-0131/2018")
map4<-tm_shape(Datajoin)+tm_polygons("X2017",palette="Reds",contrast=1)+tm_layout(legend.frame="Red",title="David M. ENC222-0131/2018")
tmap_mode("view")
print(tmap_arrange(map1,map2,map3,map4))