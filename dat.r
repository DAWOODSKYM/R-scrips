library(sf)
library(dplyr)
library(tmap)
counties<- st_read("data/counties.shp")
Map1<-tm_shape(counties)+ tm_fill()
#counties<- mutate(counties,pop.million=Total_Pop_/1000000)
head(counties)
plot(Map1)