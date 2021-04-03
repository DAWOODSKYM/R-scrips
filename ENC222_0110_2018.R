#ENC222_0110_2018
#JACKSON KIMANI MBUGUA
library("spData")
library("dplyr")
library("tmap")
library ("XML")
library("RColorBrewer")
#Scrap
url<-"http://wdi.worldbank.org/table/2.1"
data<-readHTMLTable(url)
tab1<-data$scrollTable
#creating a dataframe for the indicator
indicator <-tab1[c(1,11:11)]
#subsetting data to region
myData<- subset(tab1, tab1$V1%in% c("Turkey","Israel","Lebanon","Cyprus", "Jordan","Syrian Arab Republic","Kuwait","Iraq","Iran, Islamic Rep.","Oman","Qatar","Saudi Arabia","United Arab Emirates","Bahrain", "Yemen, Rep."))
#Getting the required map
mymap<- subset(world, world$name_long%in% c("Turkey","Israel","Lebanon","Cyprus", "Jordan","Syrian Arab Republic","Kuwait","Iraq","Iran, Islamic Rep.","Oman","Qatar","Saudi Arabia","United Arab Emirates","Bahrain", "Yemen, Rep."))
#joining myData to mymap(shape)
join=left_join(mymap,myData,by =c('name_long'= 'V1'))
index=sapply(join,is.factor)
join[index]=lapply(join[index],function(x)as.numeric(as.character(x)))

map1<-tm_shape(join)+tm_polygons("V2", palette= "Blues", contrast=.7, id="hh", title="2001")+tm_compass(type="8star", position=c("right", "top"),text.size=0.4)+
     tm_scale_bar(breaks=c(0,100,200), text.size=0.5)+
      tm_layout(legend.bg.color="grey90", legend.bg.alpha=.5, legend.frame=TRUE)+tm_layout(main.title="",title="Crude Birth Rate",main.title.size=0.5)
map2<-tm_shape(join)+tm_polygons("V5",  palette= "Blues", contrast=.7, id="hh", title="2005")+tm_compass(type="8star", position=c("right", "top"),text.size=0.4)+
     tm_scale_bar(breaks=c(0,100,200), text.size=0.5)+
      tm_layout(legend.bg.color="grey90", legend.bg.alpha=.5, legend.frame=TRUE)+tm_layout(main.title="",title="Crude Birth Rate",main.title.size=0.5)
map3<-tm_shape(join)+tm_polygons("V8", palette= "Blues", contrast=.7, id="hh", title="2009")+tm_compass(type="8star", position=c("right", "top"),text.size=0.4)+
     tm_scale_bar(breaks=c(0,100,200), text.size=0.5)+
      tm_layout(legend.bg.color="grey90", legend.bg.alpha=.5, legend.frame=TRUE)+tm_layout(main.title="",title="Crude Birth Rate",main.title.size=0.5)
map4<-tm_shape(join)+tm_polygons("V11", palette= "Blues", contrast=.7, id="hh", title="2013")+tm_compass(type="8star", position=c("right", "top"),text.size=0.4)+
     tm_scale_bar(breaks=c(0,100,200), text.size=0.5)+
      tm_layout(legend.bg.color="grey90", legend.bg.alpha=.5, legend.frame=TRUE)+
	  tm_credits("RegNO: ENC222_0110_2018\n Name: JACKSON KIMANI MBUGUA", position=c(0.2, 0.0001))+tm_layout(main.title="",title="Crude Birth Rate",main.title.size=0.5)
#Printing matrix maps
matrix_map<- tmap_arrange(map1,map2,map3,map4)
print(matrix_map)
