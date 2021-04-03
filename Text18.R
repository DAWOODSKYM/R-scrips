library(rvest)
library(tmap)
library(RCurl)
library(ggplot2)
library(plyr)
library(sf)
library(spData)
library(tmaptools)
library(leaflet)
library(XML)
library (dplyr)
library(RColorBrewer)
URL <- "http://wdi.worldbank.org/table/2.17"
webpage <- read_html("http://wdi.worldbank.org/table/2.17")
parse_html<-htmlParse(getURL(URL))
table<-getNodeSet(parse_html,c('//*[@id="ucCustomTablePreview_customTablePreview"]/div[1]','//*[@id="scrollTable"]'))

#table 1 html
indicator<-readHTMLTable(table[[1]])
#table 2 html
data<-readHTMLTable(table[[2]])

head(indicator)
head(data)
merged<-rbind(indicator,data)
names (merged)<- as.matrix(merged[1,])
merged <-merged[-1,]
merged[]apply(merged, function(x)type.convert (as.character(x)))
names (merged)[1]="name_long"
names (merged)[4]="Diabetes Prevalence"
names (merged)[9]="Youth Male"
names (merged)[10]="Youth Female"
names(merged)[12]="Nutrition"
names(merged)[13]="Non-communicable"
names(merged)[14]="Injuries"
info<- subset(merged, merged$name_long%in% c("Argentina","Bolivia","Brazil","Chile", "Colombia","Ecador","Guyana","Paraguay","Peru","Suriname","Uruguay","Venezuela,RB"))
info
mymap<- subset(world, world$name_long%in% c("Argentina","Bolivia","Brazil","Chile", "Colombia","Ecador","Guyana","Paraguay","Peru","Suriname","Uruguay","Venezuela,RB"))
mymap
mymap_and_info <-inner_join(mymap,info)
print(colnames(mymap_and_info))
tmap_options(max.categories = 4)
map1<-tm_shape(mymap_and_info)+tm_polygons("Diabetes Prevalence")+tm_layout(legend.frame="red",main.title="Diabetes Prevalence",title="Mercy Minoo",main.title.size=1)
map2<-tm_shape(mymap_and_info)+tm_polygons("Nutrition")+tm_layout(legend.frame="red",main.title="Nutrition",title="ENC222-0120/2018",main.title.size=1)
map3<-tm_shape(mymap_and_info)+tm_polygons("Non-communicable")+tm_layout(legend.frame="red",main.title="Non-communicable",title="Mercy Minoo",main.title.size=1)
map4<-tm_shape(mymap_and_info)+tm_polygons("Injuries")+tm_layout(legend.frame="red",main.title="Injuries",title="ENC222-0120/2018",main.title.size=1)
tmap_mode("view")
print(tmap_arrange(map1,map2,map3,map4))
