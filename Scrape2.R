library("xml2") 
library("rvest") 
library("stringr")
url <- ("http://wdi.worldbank.org/table/2.18#")
webpage <- read_html(url)
title_html <- html_nodes(webpage, "htitle")
title <- html_text(title_html)
head(title)
str_replace_all(title, '[\r\n]' , '')
Country_html <- html_nodes(webpage, ".country")
price <- html_text(price_html)
str_replace_all(title, '[\r\n]' , '')
desc_html <- html_nodes(webpage, "div#productDescription")
desc <- html_text(desc_html)
desc <- str_replace_all(desc, '[\r\n\t]' , '')
desc <- str_trim(desc)> head(desc)
rate_html <- html_nodes(webpage, "span#acrPopover")
rate <- html_text(rate_html)
rate <- str_replace_all(rate, '[\r\n]' , '')
rate <- str_trim(rate)
head(rate)
size_html <- html_nodes(webpage, "div#variation_size_name")
size_html <- html_nodes(size_html, "span.selection")
color_html <- html_nodes(webpage, "div#variation_color_name")
color_html <- html_nodes(color_html, "span.selection")
color <- html_text(color_html)
color <- str_trim(color)
head(color)
size <- html_text(size_html)
size <- str_trim(size)
head(size)
product_data <- data.frame(Title = title, Price = price,Description = desc, Rating = rate, Size = size, Color = color)
print(product_data)