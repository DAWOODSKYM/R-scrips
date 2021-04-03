library(rvest)
library(XML)
URL <- "http://wdi.worldbank.org/table/2.14"
webpage <- read_html("http://wdi.worldbank.org/table/2.14")
parse<-htmlParse(getURL(URL))
tables<-getNodeSet(parse,c('//*[@id="ucCustomTablePreview_customTablePreview"]/div[1]','//*[@id="scrollTable"]'))
table1<-readHTMLTable(tables[[2]])
ds<-data.frame(table1)

names(ds)[1]="name_long"
names (ds)[11]="Modeled Estimates of 100,000"
names(ds)[8]="% Pertanal care"
names(ds)[9]="Births attended to"
names(ds)[10]="National Estimates"
names(ds)[12]="lifetimeRisk of Maternal mortality"