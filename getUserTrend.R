getWordTrend <- function(df){
  data("stop_words")
  replace_reg1 <- "https://t.co/[A-Za-z\\d]+|"
  replace_reg2 <- "http://[A-Za-z\\d]+|&amp;|&lt;|&gt;|RT|https"
  replace_reg <- paste0(replace_reg1, replace_reg2)
  unnest_reg <- "([^A-Za-z_\\d#@']|'(?![A-Za-z_\\d#@]))"
  df <- df %>% 
    as.data.frame() %>%
    select(text, created)
  df.trend <- df %>%
    filter(!str_detect(text, "^RT")) %>%
    mutate(text = str_replace_all(text, replace_reg, "")) %>%
    unnest_tokens(word, text, token = "regex", pattern = unnest_reg) %>%
    filter(!word %in% stop_words$word,
           str_detect(word, "[a-z]"))
  df.trend <- df.trend %>% mutate(created = as.Date(created))
  word.by.time <- df.trend %>%
    filter(!str_detect(word, "^@")) %>%
    mutate(time_floor = created) %>%
    count(time_floor, word) %>%
    group_by(time_floor) %>%
    mutate(time_total = sum(n)) %>%
    group_by(word) %>%
    mutate(word_total = sum(n)) %>%
    ungroup() %>%
    rename(count = n)  
  
  #data frame has one row for each person-word combination; the data column is a
  #list column that contains data frames, one for each combination of person and word
  nested.data <- word.by.time %>% nest(-word)
  nested.mod <- nested.data %>%
    mutate(models = map(data, ~ glm(cbind(count, time_total) ~ time_floor, ., 
                                    family = "binomial")))
  
  #pull out the slopes for each of these models and find the important
  #ones.                                                                                                                     
  slope <- nested.mod %>%
    unnest(map(models, tidy)) %>%
    filter(term == "time_floor") %>%
    mutate(adjusted.p.value = p.adjust(p.value))
  
  top.slopes <- slope %>%
    select(-statistic, -p.value) 
  word.by.times <- word.by.time %>%
    inner_join(top.slopes, by = c("word"))
  return(word.by.times)  
  
}

