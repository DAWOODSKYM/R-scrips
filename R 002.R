#name: David muchiri
#reg No. Enc222_0131/2018
library("sf")
counties <- st_read("data/counties.shp")
cols<-names(counties)
print(cols)
plot(counties["Av_HH_Size"],breaks=c(1,2,3,4,5,6,7,8,9,10))
