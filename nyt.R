library(jsonlite)
library(dplyr)
library(tidyr)
library(tidytext)
library(tidyverse)
library(ggplot2)
library(stringr)
 
library(rtimes)
Sys.setenv(NYTIMES_KEY = "58ae0cebe4a84b47b2bf03c8f651e7c4")

getArticle <- function(term, begin_date, end_date){
  begin_date <- str_replace_all(begin_date, "-", "")
  end_date <- str_replace_all(end_date, "-", "")
  allNYTSearch <- as_search(q = term, begin_date = begin_date, end_date = end_date)
  dat <- allNYTSearch$data
  df <- dat %>%
    select(section_name, headline.main)
  colnames(df) <- c("section", "text")
  
  df <- df %>% filter(!is.na(section))
  return(df)
}


cleanAndGroupArticle <- function(df){
  data("stop_words")
  art.tidy <- df %>%
    select(section, text)%>%
    filter(str_detect(text, "^[^>]+[A-Za-z\\d]") | text == "",
           !str_detect(text, "writes(:|\\.\\.\\.)$"),
           !str_detect(text, "^In article <"))
  
  clean <- art.tidy %>%
    mutate(text = gsub('[[:digit:]]+', ' ', text)) %>%
    mutate(text = gsub('[[:punct:]]+', ' ', text)) %>%
    mutate(text = tolower(text)) %>%
    unnest_tokens(word, text) %>%
    filter(str_detect(word, "[a-z']$"),
           !word %in% stop_words$word)
  clean <- clean %>% group_by(section, word) %>% mutate(count = n())
  words_by_section <- clean %>%
    count(section, word, sort = TRUE) %>%
    filter(!is.na(section))%>%
    ungroup()
  return(words_by_section)
}



#correlation between section
library(widyr)
library(ggraph)
library(igraph)
set.seed(2017)

#A network of section group based on the correlation of word counts between
#them, including only connections with a correlation greater than 0.4

getCorrelation <- function(words_by_section){
  section.cor <- words_by_section %>%
    pairwise_cor(section, word, n, sort = TRUE)
  tmp <- section.cor %>%
    graph_from_data_frame() %>%
    ggraph(layout = "fr") +
    geom_edge_link(aes(alpha = correlation, width = correlation,  edge_colour = "#3CB371")) +
    geom_node_point(alpha = 0.5,size = 6, color = "#C71585") +
    geom_node_text(aes(label = name, size=8), repel = TRUE) +
    theme_void()
  return(tmp)
}

getSentiment <- function(words_by_section){
  art.sentim <- words_by_section %>%
    inner_join(get_sentiments("afinn"), by = "word") %>%
    group_by(section) %>%
    summarize(score = sum(score * n) / sum(n))
  
  
  art.sentim %>%
    mutate(section = reorder(section, score)) 
    
  
  return(art.sentim)
}

 