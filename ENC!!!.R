#David Muchiri Kimotho
#ENC222_0131_2018
library(tmap)
library(RCurl)
library(ggplot2)
library(plyr)
library(XML)
library(sf)
library(spData)
library(rvest)
library(tmaptools)
library(leaflet)
library (dplyr)
library(RColorBrewer)
URL <- "http://wdi.worldbank.org/table/2.14"
webpage <- read_html("http://wdi.worldbank.org/table/2.14")
parse_html<-htmlParse(getURL(URL))
table<-getNodeSet(parse_html,c('//*[@id="ucCustomTablePreview_customTablePreview"]/div[1]','//*[@id="scrollTable"]'))
indicator<-readHTMLTable(table[[1]])
data<-readHTMLTable(table[[2]])
head(indicator)
head(data)
merged<-rbind(indicator,data)
names (merged)<- as.matrix(merged[1,])
merged <-merged[-1,]
merged[]lapply(merged, function(x)type.convert (as.character(x)))
names (merged)[1]="name_long"
names (merged)[11]="Modeled Estimates of 100,000"
names(merged)[8]="% Pertanal care"
names(merged)[9]="Births attended to"
names(merged)[10]="National Estimates"
names(merged)[12]="lifetimeRisk of Maternal mortality"
info<- subset(merged, merged$name_long%in% c("Argentina","Bolivia","Brazil","Chile", "Colombia","Ecador","Guyana","Paraguay","Peru","Suriname","Uruguay","Venezuela,RB"))
info
mymap<- subset(world, world$name_long%in% c("Argentina","Bolivia","Brazil","Chile", "Colombia","Ecador","Guyana","Paraguay","Peru","Suriname","Uruguay","Venezuela,RB"))
mymap
mymap_and_info <-inner_join(mymap,info)
print(colnames(mymap_and_info))
tmap_options(max.categories = 4)
Modeled<-tm_shape(mymap_and_info)+tm_polygons("Modeled Estimates of 100,000")+tm_layout(legend.frame="blue",main.title="Modeled Estimates per 100,000 live births",title="David Muchiri",main.title.size=1)
Pertanal<-tm_shape(mymap_and_info)+tm_polygons("% Pertanal care")+tm_layout(legend.frame="blue",main.title="% of women Receiving Pertanal care",title="ENC222-0131/2018",main.title.size=1)
Births<-tm_shape(mymap_and_info)+tm_polygons("Births attended to")+tm_layout(legend.frame="blue",main.title="Births attended to by skilled staff",title="David Muchiri",main.title.size=1)
National<-tm_shape(mymap_and_info)+tm_polygons("National Estimates")+tm_layout(legend.frame="blue",main.title="National Estimates Per 100,000 live Births",title="ENC222-0131/2018",main.title.size=1)
tmap_mode("view")
print(tmap_arrange(Modeled,Pertanal,Births,National))
