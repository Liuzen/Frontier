# Sentiment Analysis from New York Times and Twitter 

## Project Member
| No | Photo Profile | Member Name | Github ID | Student ID |
| ------ | ------ | ------ | ------ | ------ |
| 1. | <img src="https://avatars.githubusercontent.com/elaine05" width=100 height=100 /> | Nathania S | <a title="elaine05" href="https://github.com/elaine05">@elaine05</a> | 00000015730 | 
| 2. | <img src="https://avatars.githubusercontent.com/liuzen" width=100 height=100/> | Hendrian Lunardi | <a title="@liuzen" href="https://github.com/liuzen">@liuzen</a> | 00000012778 |
| 3. | <img src="https://avatars.githubusercontent.com/se4lonline" width=100 height=100/> | Leonardo Jivalino | <a title="@se4lonline" href="https://github.com/se4lonline">@se4lonline</a> | 00000015443 |

## Sentiment Analysis
Our sentiment analysis was done using a lexicon-approach or so-called dictionary-based method. Lexicon approach find a total sentiment of a piece of text by adding up the individual senti-score for each word in the text.

![posneg](https://github.com/Liuzen/Frontier/blob/master/Image/posneg.jpg)

The AFINN lexicon is based on unigram, it assigns words with a score that runs between -5 and 5, with negative scores indicating negative sentiment and positive scores indicating positive sentiment.

### Sentiment analysis using lexicon approach was done in the following way:
-	The data collected is live data, it contains many information, i.e. for twitter; such as the user who tweet (screenName), the tweets text, the tweets location (lat and long), and many others. For NYT, snippet, headline, section, etc. But since our goal are to determine the sentiment of the tweet, we will focus on tweets text only.
-	The collected data contain many noise, such as punctuation, number, and others (especially twitter data). Therefore, we do some cleaning.
- We then eliminate some commonly word (stopwords), such as “and,” “the”, then, of, it, etc.
- The clean text was then tokenize into a single word (unigram).  The unigram was then match to the lexicon to get its sentiment score, if the word does not exist in lexicon, it simply ignores it. 

e.g. 
the first half of the movie was amazing, it a pity the ending suck, become 
![word1](https://github.com/Liuzen/Frontier/blob/master/Image/word1.jpg)
![word2](https://github.com/Liuzen/Frontier/blob/master/Image/word2.jpg)

## Hashtag trend-analysis
The idea was to fit GLM to predict the word frequency with the relative point of time. If the coefficient of the point of time is very unlikely to be zero (p value < 0.5), we say that the frequency of this word has changed over time. 

Model fit were done in the following way: 
-	We were using username to search the list of hashtag/words he/she use over a certain period of time, or we can view the top 20 tweeters based on their word/hashtag frequency over time, pick one we want to analyze.
-	Extract the hashtag from user tweet, this can be done by userTimeLine function, which will retrieve the tweet of a given user, do some cleaning, and extract the list of hashtag.
-	Next, we define a time variable to defines the unit of time (time bin) each tweet was posted in.
-	Then we count the how many times the user uses that hashtag in that time bin, the total number of all hashtag the user use, and the number of hashtag usage over the whole time (i.e. year).  Thus, we are able to use these variable to do some modelling.
-	The GLM (Generalized Linear Model) was used for modelling, the model resulting a slopes for each hashtag along with its p.value.   

## Visualization
- Twitter
  -	We visualize word contribution toward positive and negative text, as expected for positive sentence, the common words are proud, good, wow, best, love, etc. While for negative are illegal, idiot, shocking, charged, bullshit, worst, etc. 
![a](https://github.com/Liuzen/Frontier/blob/master/Image/a.png)

  -	We also show the distribution of word based on its score across negative and positive class (histogram). We want to know the distribution of score within class, since for positive class we have 5 score value (0,1,2,3,4,5), so does the negative class. 
![b](https://github.com/Liuzen/Frontier/blob/master/Image/b.png)
![c](https://github.com/Liuzen/Frontier/blob/master/Image/c.png)

  -	We want to know the which group of user using a certain hashtag and how often the use of the hashtag. Therefore, we extract the list of user, which his/her tweets contain the hashtag, and count the number of hashtag usage. Hence, we can visualize the top 20 tweeters for a given hashtag. 
![d](https://github.com/Liuzen/Frontier/blob/master/Image/d.png)
![e](https://github.com/Liuzen/Frontier/blob/master/Image/e.png)

  -	After get the list of top 20 user, we may choose one with the highest hashtag frequency to analyze, or we may able to search other user (not list in top 20), then we may be able to view the trends of hashtag frequencies for a certain user as time has passed.  
![f](https://github.com/Liuzen/Frontier/blob/master/Image/f.png)
All slopes for user are negative, which means he/she has not tweeted at higher rate using any specific hashtag/word, but instead used a variety of different word, he tweets earlier contained the hashtag shown in this plot at higher proportions. Hashtag he uses when post a new tweet, like mahasiswa, uph has gone down in frequency.

- NYT-articles
We want to examine which words commonly occur together in same article section. To do this, we tokenize the sentence into word, then we find the correlation within words using Pearson method.
![g](https://github.com/Liuzen/Frontier/blob/master/Image/g.png)
From above image, we can see the article contain trump, trade, war keywords occur in many section, such as Asia pacific, Television, book review, Economy, Politics, etc. The width of the line indicates how strong their correlation, in other words, the thicker the line, the higher the correlations. Meanwhile, we can see across all article section the sentiments towards trump are negative.
![h](https://github.com/Liuzen/Frontier/blob/master/Image/h.png)
  
  


## Installation
- Clone this repository
  - `git clone https://github.com/Liuzen/Frontier`
- Open RStudio and open R File from the directory
- Install some packages:
  - `shiny` with command `install.packages("shiny")`
  - `wordcloud2` with command `install.packages("wordcloud2")`
  - `shinythemes` with command `install.packages("shinythemes")`
  - `twitteR` with command `install.packages("twitteR")`
  - `stringr` with command `install.packages("stringr")`
  - `ROAuth` with command `install.packages("ROAuth")`
  - `RCurl` with command `install.packages("RCurl")`
  - `ggplot2` with command `install.packages("ggplot2")`
  - `reshape` with command `install.packages("reshape")`
  - `tm` with command `install.packages("tm")`
  - `RJSONIO` with command `install.packages("RJSONIO")`
  - `purrr` with command `install.packages("purrr")`
  - `broom` with command `install.packages("broom")`
  - `gridExtra` with command `install.packages("gridExtra")`
  - `plyr` with command `install.packages("plyr")`
  - `tidyverse` with command `install.packages("tidyverse")`
  - `tidytext` with command `install.packages("tidytext")`
  - `qdap` with command `install.packages("qdap")`
  - `Cairo` with command `install.packages("Cairo")`
  - `openssl` with command `install.packages("openssl")`
  - `httpuv` with command `install.packages("httpuv")`
  - `dplyr` with command `install.packages("dplyr")`
  - `lubridate` with command `install.packages("lubridate")`
  - `jsonlite` with command `install.packages("jsonlite")`
  - `tidyr` with command `install.packages("tidyr")`
  - `stringr` with command `install.packages("stringr")`
  - `rtimes` with command `install.packages("rtimes")`
  
## Packages

- twitteR

twitteR is an R package which provides access to the Twitter API. Most functionality of the API is supported, with a bias towards API calls that are more useful in data analysis as opposed to daily interaction. 

- rtimes

Interface to Congress, Campaign Finance, Article Search, and Geographic 'APIs' from the New York Times (<http://developer.nytimes.com/>) and 'ProPublica' (<https://www.propublica.org/datastore/apis>). This client covers a subset of the New York Times and 'ProPublica' 'APIs'.

- stringr

stringr is a neat package for dealing with strings (text) and data cleaning/formatting

- shiny

shiny is a web application framework for R and easy to build interactive web applications with R. Automatic "reactive" binding between inputs and outputs and extensive prebuilt widgets make it possible to build beautiful, responsive, and powerful applications with minimal effort.

- wordcloud2

wordcloud2 is a visual representation of text data. Tags are usually single words, and the importance of each tag is shown with font size or color. 

- ROAuth

Provides an interface to the OAuth 1.0 specification allowing users to authenticate via OAuth to the server of their choice.

- RCurl

Provides functions to allow one to compose general HTTP requests and provides convenient functions to fetch URIs, get & post forms, etc. and process the results returned by the Web server. This provides a great deal of control over the HTTP/FTP/... connection and the form of the request while providing a higher-level interface than is available just using R socket connections
  
- ggplot2

ggplot2 is a system for 'declaratively' creating graphics, based on "The Grammar of Graphics". You provide the data, tell 'ggplot2' how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details.

- reshape

Flexibly restructure and aggregate data using just two functions: melt and cast.

- tm

tm is a framework for text mining applications within R.

- RJSONIO

RJSONIO is a package that allows conversion to and from data in Javascript object notation (JSON) format. This allows R objects to be inserted into Javascript/ECMAScript/ActionScript code and allows R programmers to read and convert JSON content to R objects.

- tidyr 

tidyr makes it easy to tidy up your data. Neat data is easy to use data: easy to do munge (with dplyr), visualize (with ggplot2 or ggvis) and model (with hundreds of R modeling packages).

- jsonlite 

The jsonlite package is a web optimized JSON parser / generator. Its main strength is that it implements two-way mapping between JSON data and the most important R data type .

- lubridate

lubridate is an R package that facilitates work with date and time.

- dplyr 

dplyr is the iteration of plyr, focusing only on the data frame. dplyr is faster and has a more consistent API

- httpuv 

httpuv provides low-level sockets and protocol support to handle HTTP and WebSocket requests directly from within R.

- openssl 

openssl is a toolkit for Encryption, Signature, and OpenSSL Based Certificates

- Cairo 

The R graphics device uses the cairo graphics library to create high-quality bitmaps (PNG, JPEG, TIFF), vectors (PDF, SVG, PostScript) and display (X11 and Win32) outputs.

- qdap 

qdap serves to automate many tasks related to the quantitative discourse analysis of discourse transcripts including the number of sentence frequency variations, words, sentences, speech turns, syllables and other various analytical tasks. This package provides a parsing tool for preparing data transcript.

- tidytext 

tidytext allows data mining for word processing and sentiment analysis using 'dplyr', 'ggplot2', and other neat tools.

- tidyverse 

tidyverse is a collection of R packages designed for data science. All packages share an underlying philosophy and common API.

- plyr 

plyr is a set of tools that solve a set of common problems: you need to solve big problems into manageable parts, operate on each piece and then put all the pieces back together.

- gridExtra 

gridExtra provides a number of user-level functions to work with a "grid" graph, especially for organizing multiple grid-based plots on a page, and drawing tables.

- broom 

Broom package takes the output of messy built-in functions in R, like lm, nls, or t.test, and turns them into neat data frames.

- purrr 

purrr improves the functional programming toolkit (FP) in R by providing a complete and consistent set of tools to work with functions and vectors.

