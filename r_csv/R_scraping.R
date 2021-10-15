url <- "https://en.wikipedia.org/wiki/Comma-separated_values"
library(rvest)
library(xml2)
library(magrittr)

wiki_pop <- read_html(url)
wiki_pop

global_pop <- wiki_pop %>%
  html_nodes(xpath = '//*[@id="mw-content-text"]/div[1]/table[2]') %>%
  html_table()

write.csv(global_pop, file = "R_output.csv", row.names = F)
