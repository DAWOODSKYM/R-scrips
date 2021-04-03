library("sf")
#library("RColorBrewer")
library("tmap")
#library("mapview")
counties<-st_read("data/counties.shp")
#map2<-tm_shape(counties) +tm_polygons("female_201")
#map1<-tm_shape(counties)+ tm_polygons("male_2019")
#map3<-tmap_arrange(map1,map2)
#tm_borders()+
#tm_basemap(server="openTopoMap")
#tmap_mode("view")
#print(map3)
#add legend,naort arrow
Map4<- tm_shape(counties) +
  tm_polygons("Av_HH_Size",palette="Reds",contrast=.7,id="hh",title="HH_size")+
  tm_compass(type="8star",position=c("right","top"),text.size=0.8)+
  tm_scale_bar(breaks=c(0,100,200),text.size=0.5)+
  tm_layout(legend.bg.color="grey90",legend.bg.alpha=0.5,legend.frame=TRUE)+
  tm_credits("Reg:ENC222_0131/2018\nName:David Muchiri",position=c(0.2,0.01))
print(Map4)