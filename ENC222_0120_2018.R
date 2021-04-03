#MercyMinoo Kasyoka
#ENC222-0120/2018
library("sf")
library("spData")
library("rvest")
library("ggplot2")
library("tmap")
library("dplyr")
library("rworldmap")

#scrapping the worldbank website
link<-("https://wdi.worldbank.org/table/2.17")
webpage<-read_html("https://wdi.worldbank.org/table/2.17")

#parse html
parse_HTML<-HTMLparse(getlink(link))

#create dataframe
tables<-getNodeSet(parse,c('//*[@id="ucCustomTablePreview_customTablePreview"]/div[1]','//*[id="scrollTable"]'))
tables<-readHTMLTable(tables[[2]])
df<-data.frame(table1)

#Subseting data
newdata<-subset(mydata,age>=20/age<79,)
select=c("Argentina","Bolivia","Brazil","chile","Colombia","Ecador","Guyana","Paraguay","Peru","Suriname","Uruguay","venezuela")

plot(world)

#plot diabetes prevalence 2010
diabetesprev_map<-tm_shape(countries)+tm_polygons("diabetesprev_2010")
#plot diabetes prevalence 2019
diabetesprev_map<-tm_shape(countries)+tm_polygons("diabetesprev_2019")

#create a matrix for the four maps
m1<-tmap_arrange(diabetesprev_2010,diabetesprev_2019)
#plot the map
print(m1)

plot(["diabetesprev"],main="Diabetes Prevalence")

mtext("Name:Mercy Minoo",side=1,line=2.5,at=0.11)
mtext("Reg. No:ENC222/0120/2018",side=1,line=3.5,at=0.2)



