library("sf")
library("spData")
library("RColorBrewer")
library("rgdal")
#world<- st_read("world/worl2/TM_WORLD_BORDERS-0.3.shp")
#cols<-names(world)
#print(cols)
#plot(world)
#mymap<- subset(world["NAME"], world$NAME%in% c("Argentina","Bolivia","Brazil","Chile", "Colombia","Ecador","Guyana","Paraguay","Peru","Suriname","Uruguay","Venezuela"))
#plot(mymap)
temp<-tempfile()
temp2<-tempfile()
download.file("https://thematicmapping.org/downloads/TM_WORLD_BORDERS-0.3.zip",temp)
data<-unzip(zipfile=temp,exdir=temp2)
shp<-list.files(temp2,pattern=".shp$",full.names=TRUE)
world <-sf::st_read(shp)
#subset my map
mymap<- subset(world["NAME"], world$NAME%in% c("Argentina","Bolivia","Brazil","Chile", "Colombia","Ecador","Guyana","Paraguay","Peru","Suriname","Uruguay","Venezuela"))
plot(mymap)