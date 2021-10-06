url <- "https://en.wikipedia.org/wiki/Comma-separated_values"
library(rvest)
library(xml2)
library(magrittr)

wiki_pop <- read_html(url)
wiki_pop

global_pop <- wiki_pop %>%
  html_nodes(xpath = '//*[@id="mw-content-text"]/div[1]/table[2]') %>%
  html_table()

r_csv <- data.frame(global_pop) # save as dataframe
r_csv[r_csv==""]<-NA # fill in empty space with NA
r_csv
write.table(r_csv, file = "R_output.csv", sep = ",", row.names = F)
