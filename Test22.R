library(rvest)
library(tmap)
library(dplyr)
library(sf)
library("RCurl")
library(spData)
library(rgdal)
library(XML)
URL <- "http://wdi.worldbank.org/table/2.14"
webpage <- read_html("http://wdi.worldbank.org/table/2.14")
parse<-htmlParse(getURL(URL))
tables<-getNodeSet(parse,c('//*[@id="ucCustomTablePreview_customTablePreview"]/div[1]','//*[@id="scrollTable"]'))
table1<-readHTMLTable(tables[[2]])
ds<-data.frame(table1)
#renaming the columns
names(ds)[1]="NAME"
names (ds)[11]="Modeled Estimates of 100,000"
names(ds)[8]="% Pertanal care"
names(ds)[9]="Births attended to"
names(ds)[10]="National Estimates"
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