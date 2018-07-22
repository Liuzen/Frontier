library(twitteR)
library(stringr)
library(ROAuth)
library(RCurl)
library(ggplot2)
library(reshape)
library(tm)
library(RJSONIO)
library(purrr)
library(broom)
library(gridExtra)
library(plyr)
library(tidyverse)
library(tidytext)
library(qdap)
library(Cairo)
library(wordcloud2)
library(openssl)
library(httpuv)
library(dplyr)
library(lubridate)
 
Auth <- function(){
  consumer_key <-"KNf2iiQtzwfWvS10Ybl9636hJ"
  
  consumer_secret <- "mf9UUoflUWHkkzVjYyfEN4vUZjz8kPRNtO4ONPnCVXVBvkVTd9"
  
  access_token<-"4034825298-W6zl6XZG7asHQkToVQX3fl31xR37pkq2MpMsSeT"
  access_secret <- "oLkrHq5a2V7bivZthC1IjYS2O6BgdoawvGb0p9YYYcX95"
  
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
  origop <- options("httr_oauth_cache")
  options(httr_oauth_cache = TRUE)
}  

shinyServer(function(input, output) { 
  Auth()
  source("getUserTrend.R")
  twListDF<-function(twtList)
  {
    df<- do.call("rbind",lapply(twtList,as.data.frame))
    #removes emoticons
    df$text <- sapply(df$text,function(row) iconv(row, "latin1", "ASCII", sub=""))
    df$text = gsub("(f|ht)tp(s?)://(.*)[.][a-z]+", "", df$text)
    return (df$text)
  }
  
 
  positive_word=scan('positive-words.txt', what='character',comment.char=';')
  negative_word=scan('negative-words.txt', what='character',comment.char=';')
  
  wordDatabase<-function()
  {
    positive_word<<-c(positive_word, 'Congrats', 'prizes', 'prize', 'thanks', 'thnx', 'Grt', 'gr8', 'plz', 'trending', 'recovering', 'brainstorm', 'leader')
    negative_word<<-c(negative_word, 'Fight', 'fighting', 'wtf', 'arrest', 'no', 'not', 'fall')
  }
  
  score.sentiment <- function(sentences, positive_word, negative_word, .progress='none')
  {
    require(plyr)
    require(stringr)
    list=lapply(sentences, function(sentence, positive_word, negative_word)
    {
      sentence = gsub('[[:punct:]]',' ',sentence)
      sentence = gsub('[[:digit:]]',' ',sentence)
      sentence = gsub('[[:cntrl:]]','',sentence)
      sentence = gsub('\\d+','',sentence)
      sentence = gsub('\n','',sentence)
      
      sentence = tolower(sentence)
      word.list = str_split(sentence, '\\s+')
      words = unlist(word.list)
      match.pos = match(words, positive_word)
      match.neg = match(words, negative_word)
      match.pos = !is.na(match.pos)
      match.neg = !is.na(match.neg)
      pp=sum(match.pos)
      nn = sum(match.neg)
      score = sum(match.pos) - sum(match.neg)
      list1=c(score, pp, nn)
      return (list1)
    }, positive_word, negative_word)
    score_new=lapply(list, `[[`, 1)
    pos=score=lapply(list, `[[`, 2)
    nn1=score=lapply(list, `[[`, 3)
    
    scores.df = data.frame(score=score_new, text=sentences)
    positive.df = data.frame(Positive=pos, text=sentences)
    negative.df = data.frame(Negative=nn1, text=sentences)
    
    list_df=list(scores.df, positive.df, negative.df)
    return(list_df)
  }
  
  
  sentimentAnalyser<-function(result)
  {
    #Creating a copy of result data frame
    test1=result[[1]]
    test2=result[[2]]
    test3=result[[3]]
    
    #Creating data frames for each of the following Score, Positive and Negative
    #Removing text column from data frame
    test1$text=NULL
    test2$text=NULL
    test3$text=NULL
    #Storing the first row(Containing the sentiment scores)  
    q1=test1[1,]
    q2=test2[1,]
    q3=test3[1,]
    qq1=melt(q1,var='Score')
    qq2=melt(q2,var='Positive')
    qq3=melt(q3,var='Negative') 
    qq1['Score'] = NULL
    qq2['Positive'] = NULL
    qq3['Negative'] = NULL
    #Creating data frame
    score.df = data.frame(Text=result[[1]]$text, Score=qq1)
    pos.df = data.frame(Text=result[[2]]$text, Score=qq2)
    neg.df = data.frame(Text=result[[3]]$text, Score=qq3)
    
    #Merging three data frames into one
    table_final=data.frame(Text=score.df$Text, Positive=pos.df$value, Negative=neg.df$value, Score=score.df$value)
    return(table_final)
  }
  
  percentage<-function(table_final)
  {
    #Positive Percentage
    
    #Renaming
    posSc=table_final$Positive
    negSc=table_final$Negative
    
    #Adding column
    table_final$PosPercent = posSc/ (posSc+negSc)
    
    #Replacing Nan with zero
    pp = table_final$PosPercent
    pp[is.nan(pp)] <- 0
    table_final$PosPercent = pp*100
    
    #Negative Percentage
    
    #Adding column
    table_final$NegPercent = negSc/ (posSc+negSc)
    
    #Replacing Nan with zero
    nn = table_final$NegPercent
    nn[is.nan(nn)] <- 0
    table_final$NegPercent = nn*100
    
    return(table_final)
  }
  
  wordDatabase()
  
  
  twtList<-reactive({twtList<-searchTwitter(input$searchTerm, n=input$maxTweets, lang="en") })
  tweets<-reactive({tweets<-twListDF(twtList() )})
  
  result<-reactive({result<-score.sentiment(tweets(), positive_word, negative_word, .progress='none')})
  
  table_final<-reactive({table_final<-sentimentAnalyser(  result() )})
  table_final_percentage<-reactive({table_final_percentage<-percentage(  table_final() )})
  
  output$tabledata<-renderTable(table_final_percentage())
  
  #TOP TRENDING TWEETS
  
  toptrends<-function(place)
  {
    a_trends = availableTrendLocations()
    woeid = a_trends[which(a_trends$name==place),3]
    trend = getTrends(woeid)
    trends = trend[1:2]
    
    #To clean data and remove Non English words:  
    dat <- cbind(trends$name)
    dat2 <- unlist(strsplit(dat, split=", "))
    dat3 <- grep("dat2", iconv(dat2, "latin1", "ASCII", sub="dat2"))
    dat4 <- dat2[-dat3]
    return(dat4)
  }
  
  trend_table<-reactive({trend_table<-toptrends(  input$trendingTable ) })
  output$trendtable<-renderTable(trend_table() )
  
  #TOP TRENDING TWEETS
  
  toptrends<-function(place)
  {
    a_trends = availableTrendLocations()
    woeid = a_trends[which(a_trends$name==place),3]
    trend = getTrends(woeid)
    trends = trend[1:2]
    
    #To clean data and remove Non English words: 
    dat <- cbind(trends$name)
    dat2 <- unlist(strsplit(dat, split=", "))
    dat3 <- grep("dat2", iconv(dat2, "latin1", "ASCII", sub="dat2"))
    if(dat3==0)
      return(dat2)
    dat4 <- dat2[-dat3]
    
    return(dat4)
  }
  
  trend_table<-reactive({trend_table<-toptrends(  input$trendingTable ) })
  output$trendtable<-renderTable(trend_table() )	
  
  #WORDCLOUD
  
  wordclouds<- function(text)
  {
    corp = Corpus(VectorSource(text))
    corp = tm_map(corp, content_transformer(tolower))
    corp = tm_map(corp, removePunctuation)
    corp = tm_map(corp, removeNumbers)
    corp = tm_map(corp, removeWords,stopwords("en"))
    return(corp)
    
  }
  text_word<-reactive({
    text_word<-wordclouds(tweets())
  })
  
  output$word<-renderWordcloud2({
    dtm <- DocumentTermMatrix(text_word())
    td <- tidy(dtm)
    td <- td %>% select(term, count) %>% as.data.frame()%>%arrange(desc(count))
    colnames(td) <- c("word", "freq")
    wordcloud2(data = td, size = 0.5, color = "random-light", backgroundColor = "grey")
    
  })
  
  
  getWCtable <- function(cor){
    dtm <- DocumentTermMatrix(cor)
    tab <- tidy(dtm)
    senti <- tab %>%
      inner_join(get_sentiments("afinn"), by = c(term = "word"))
    
    senti <- senti %>%
      group_by(term) %>%
      summarize(occurences = n(),
                contribution = sum(score))
    
    senti <- senti %>%
      top_n(25, abs(contribution)) %>%
      mutate(term = reorder(term, contribution))  
    
    return (senti)
  }
    wordcloudtable<-reactive({
      
      wordcloudtable<- getWCtable(text_word())
    })
    output$wordcloudtable <- renderPlot({
      print(ggplot(wordcloudtable(), aes(term, contribution,fill=contribution > 0))+
                       geom_col(show.legend = FALSE) +
                scale_fill_manual(values=c("#468499","#cc0000"))+
                coord_flip())
      
    })
        
    
    
    #HISTOGRAM
    
    output$histPos<- renderPlot({
      hist(table_final()$Positive, col = rainbow(10), main = "Histogram of Positive Sentiment", xlab = "Positive Score") })
    output$histNeg<- renderPlot({hist(table_final()$Negative, col = rainbow(10), main = "Histogram of Negative Sentiment", xlab = "Negative Score") })
    output$histScore<- renderPlot({hist(table_final()$Score, col = rainbow(10), main = "Histogram of Score", xlab = "Overall Score")})
    
    #PIE CHART
    
    slices <- reactive({c(sum(table_final()$Positive), sum(table_final()$Negative)) })
    labels <- c("Positive", "Negative")
    library(plotrix)
    #pie(slices(), labels = labels, col=rainbow(length(labels)), main="Sentiment Analysis")
    output$piechart<-renderPlot({pie3D(slices(), labels = labels, col=rainbow(length(labels)),explode=0.00, main="Sentiment Analysis") })
    
    #TOP TWEETERS
    
    # Top tweeters for a particular hashtag 
    toptweeters<-function(tweetlist)
    {
      tweets <- twListToDF(tweetlist)
      tweets <- unique(tweets)
      # Make a table of the number of tweets per user
      d <- as.data.frame(table(tweets$screenName)) 
      d <- d[order(d$Freq, decreasing=T), ] #descending order of tweeters according to frequency of tweets
      names(d) <- c("User","Tweets")
      return (d)
    }
    
    # Plot the table above for the top 20
    
    d<-reactive({d<-toptweeters(  twtList() ) })
    output$tweetersplot<-renderPlot ( barplot(head(d()$Tweets, 20),  names=head(d()$User, 20), las=2, horiz=F, main="Top 20: Tweets per User", col=1) )
    output$tweeterstable<-renderTable(head(d(),20))
    
    #Top 10 TWEETERS
    
    tw1 <- reactive({ tw1 = userTimeline(input$user, n = 100) })
    tw <- reactive({ tw = twListToDF(tw1()) })
    vec1<-reactive ({ vec1 = tw()$text })
    
    
   
    extract.hashes = function(vec){
      
      hash.pattern = "#[[:alpha:]]+"
      have.hash = grep(x = vec, pattern = hash.pattern)
      
      hash.matches = gregexpr(pattern = hash.pattern,
                              text = vec[have.hash])
      extracted.hash = regmatches(x = vec[have.hash], m = hash.matches)
      
      df = data.frame(table(tolower(unlist(extracted.hash))))
      colnames(df) = c("tag","freq")
      df = df[order(df$freq,decreasing = TRUE),]
      return(df)
    }
    
    dat<-reactive({ dat = head(extract.hashes(vec1()),50) })
    dat2<- reactive ({ dat2 = transform(dat(),tag = reorder(tag,freq)) })
    
    #USER analysis
    word.trend <- reactive ({ word.trend = getWordTrend( tw() ) })
     
    output$tophashtagsplot <- renderPlot({print( ggplot(word.trend(), aes(time_floor, count/time_total, color = word, lty = word))+
                                                   geom_line(size = 1.3) +
                                                   labs(x = NULL, y = "Word frequency", 
                                                        title="Trending words in user Tweets")
                                                   )})
     
    
    source("nyt.R")
   
    
    artColl <- reactive({ artColl = getArticle(input$art, input$begin, input$end)})
    cleanArt <- reactive({cleanArt= cleanAndGroupArticle(artColl() ) })
    getCorr <- reactive({getCorrelation( cleanArt() )})
    getSent <- reactive({ getSentiment( cleanArt()  )})
    
    output$nyt <- renderPlot({ 
      print(getCorr())
    })
    
    
    output$nytSent <- renderPlot({ 
      print(ggplot(getSent(),aes(section, score, fill = score > 0)) +
                     geom_col(show.legend = FALSE) +
                     coord_flip() +
                     ylab("Average sentiment score")) 
       
    })
    
    output$nytTab <- renderTable(head(artColl(),20))
    
     
})
  
  
  
 
