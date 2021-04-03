#name: David muchiri
#reg No. Enc222_0131/2018
library("sf")
library("tmap")
counties <- st_read("data/counties.shp")
cols<-names(counties)
print(cols)
Map1<-tm_shape(counties)+tm_polygons("male_2019")
Map1<-tm_shape(counties)+tm_polygons("female_2019")
Map3<-tmap_arrange(Map1,Map2)
tmap_mode("View")
print(Map3)