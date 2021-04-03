#import libraries
library(RCurl)
library(ggplot2)
library(plyr)
library(tmap)
library(sf)
library(spData)
library(rvest)
library(tmaptools)
library(leaflet)
library(XML)
library (dplyr)
library(RColorBrewer)

#read HTML
URL <- "http://wdi.worldbank.org/table/2.17"
webpage <- read_html("http://wdi.worldbank.org/table/2.17")

#parse html
parse_html<-htmlParse(getURL(URL))

#get html node for table
table<-getNodeSet(parse_html,c('//*[@id="ucCustomTablePreview_customTablePreview"]/div[1]','//*[@id="scrollTable"]'))

#read  indicator table 1 html
indicator<-readHTMLTable(table[[1]])

#read  data table 2 html
data<-readHTMLTable(table[[2]])

head(indicator)
head(data)
#merge tables into one data frame
merged<-rbind(indicator,data)

names (merged)<- as.matrix(merged[1,])
merged <-merged[-1,]
merged[]lapply(merged, function(x)type.convert (as.character(x)))

#rename table headers in merged data frame
names (merged)[1]="name_long"
names (merged)[4]="Diabetes Prevalence"
names(merged)[12]="Nutrition"
names(merged)[13]="Non-communicable"
names(merged)[14]="Injuries"

#trim to get required data
info<- subset(merged, merged$name_long%in% c("Argentina","Bolivia","Brazil","Chile", "Colombia","Ecador","Guyana","Paraguay","Peru","Suriname","Uruguay","Venezuela"))
info
#trim to get required map
mymap<- subset(world, world$name_long%in% c("Argentina","Bolivia","Brazil","Chile", "Colombia","Ecador","Guyana","Paraguay","Peru","Suriname","Uruguay","Venezuela"))
mymap
#join my map and info data frames
mymap_and_info <-inner_join(mymap,info)
print(colnames(mymap_and_info))
#plot final map
tmap_options(max.categories = 4)
Modeled<-tm_shape(mymap_and_info)+tm_polygons("Diabetes Prevalence")+tm_layout(legend.frame="blue",main.title="Modeled Estimates per 100,000 live births",title="Mercy Minoo",main.title.size=1)
Pertanal<-tm_shape(mymap_and_info)+tm_polygons("Nutrition")+tm_layout(legend.frame="blue",main.title="% of women Receiving Pertanal care",title="ENC222-0120/2018",main.title.size=1)
Births<-tm_shape(mymap_and_info)+tm_polygons("Non-communicable")+tm_layout(legend.frame="blue",main.title="Non-communicable",title="Mercy Minoo",main.title.size=1)
National<-tm_shape(mymap_and_info)+tm_polygons("Injuries")+tm_layout(legend.frame="blue",main.title="Injuries",title="ENC222-0131/2018",main.title.size=1)

#plot map
tmap_mode("view")
print(tmap_arrange(Modeled,Pertanal,Births,National))
