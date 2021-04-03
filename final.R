library(XML)
library(rgdal)
library(rvest)
library("rworldmap")
library("RCurl")
library(tmap)
library(dplyr)
library(sf)
library(spData)
#read worldbank Table
URL <- "http://wdi.worldbank.org/table/2.14"
webpage <- read_html("http://wdi.worldbank.org/table/2.14")
parse<-htmlParse(getURL(URL))
tables<-getNodeSet(parse,c('//*[@id="ucCustomTablePreview_customTablePreview"]/div[1]','//*[@id="scrollTable"]'))
table1<-readHTMLTable(tables[[2]])
ds<-data.frame(table1)
#renaming the columns
names(ds)[1]="NAME"
names (ds)[11]="Modeled Estimates of 100,000"
names(ds)[10]="National Estimates 2008-2016"
names(ds)[12]="lifetimeRisk of Maternal mortality"
#subsetting the data
sub<- subset(ds,NAME=="Argentina"|NAME=="Brazil")
sub1<- subset(ds,NAME=="Bolivia"|NAME=="Colombia")
sub2<- subset(ds,NAME=="Chile"|NAME=="Ecuador")
sub3<- subset(ds,NAME=="Guyana"|NAME=="Paraguay")
sub4<- subset(ds,NAME=="Peru"|NAME=="Suriname")
sub5<- subset(ds,NAME=="Uruguay"|NAME=="Venezuela,RB")
SUBM<- rbind(sub,sub1,sub2,sub3,sub4,sub5,by=c("NAME"))
print(SUBM)
#join data to map
info<- joinCountryData2Map( SUBM,joinCode = "NAME",nameJoinColumn = "NAME")
#Subset Joined map to Region countries
map<- subset(info, info$NAME%in% c("Argentina","Bolivia","Brazil","Chile", "Colombia","Ecador","Guyana","Paraguay","Peru","Suriname","Uruguay","Venezuela"))

#plot my maps
tmap_options(max.categories = 6)
Maternal_Risk<-tm_shape(map)+tm_polygons("lifetimeRisk of Maternal mortality",palette="Reds",contrast=1)+tm_layout(legend.frame="Yellow",main.title="lifetimeRisk of Maternal mortality",title="lifetimeRisk of Maternal Mortality 2017",title.snap.to.legend=TRUE,main.title.size=1) +tm_scale_bar(breaks=c(0,200,400))+tm_credits("Reg: ENC222_0131_2018\nName : David Muchiri",position=c("LEFT","bottom"))

modeled<-tm_shape(map)+tm_polygons("Modeled Estimates of 100,000",palette="Greens",contrast=1)+tm_layout(legend.frame="Blue",main.title="Modeled Estimates of 100,000",title="Martenal Mortality Ratio Modelled estimates",title.snap.to.legend=TRUE,main.title.size=1) + tm_scale_bar(breaks=c(0,200,400))+tm_credits("Reg: ENC222_0131_2018\nName : David Muchiri",position=c("LEFT","bottom"))

National<-tm_shape(map)+tm_polygons("National Estimates 2008-2016",palette="Blues",contrast=1)+tm_layout(legend.frame="Red",main.title="National Estimates Per 100,000 live Births",title="Maternal Mortality National Estimates Per 100,000 live Births",title.snap.to.legend=TRUE,main.title.size=1) + tm_scale_bar(breaks=c(0,200,400))+tm_credits("Reg: ENC222_0131_2018\nName : David Muchiri",position=c("LEFT","bottom"))
final<-tmap_arrange(Maternal_Risk,modeled,National)
print(final)


