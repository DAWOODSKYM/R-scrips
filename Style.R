#load the required libraries
library(sf)
library(RColorBrewer)
library(tmap)
library(dplyr)
library(mapview)
#Read the shapefile and csv and print their coloumns names
SA<-st_read("world2/World_Countries.shp")
cols<-names(SA)
Data<-read.csv("SA2.csv")
print(Data)
#Subset the countries in the shapefile
map<- subset(SA, SA$COUNTRY%in% c("Argentina","Bolivia","Brazil","Chile", "Colombia","Ecador","Guyana","Paraguay","Peru","Suriname","Uruguay","Venezuela"))
#Join csv to shapefile
Datajoin<-left_join(map,Data,by=c('COUNTRY'='COUNTRY'))
#set view mode and print

map1<-tm_shape(Datajoin)+tm_polygons("X1999",palette="Greens",contrast=1)+tm_layout(legend.frame="Red",title="David M. ENC222-0131/2018")+tm_compass(type="radar", position=c("left", "bottom"), show.labels = 3)
#+tm_facets(along = "name")
#tmap_animation(map1, filename="Dutch_provinces.gif", width=800, delay=40)
#+tm_minimap(server = "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", position = c("left", "bottom"), toggle = TRUE)
tmap_style("beaver")
tmap_mode("plot")
print(map1)

#