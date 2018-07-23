# Sentiment Analysis from New York Times and Twitter 

## Project Member
| No | Photo Profile | Member Name | Github ID | Student ID |
| ------ | ------ | ------ | ------ | ------ |
| 1. | <img src="https://avatars.githubusercontent.com/elaine05" width=100 height=100 /> | Nathania S | <a title="elaine05" href="https://github.com/elaine05">@elaine05</a> | 00000015730 | 
| 2. | <img src="https://avatars.githubusercontent.com/liuzen" width=100 height=100/> | Hendrian Lunardi | <a title="@liuzen" href="https://github.com/liuzen">@liuzen</a> | 00000012778 |
| 3. | <img src="https://avatars.githubusercontent.com/se4lonline" width=100 height=100/> | Leonardo Jivalino | <a title="@se4lonline" href="https://github.com/se4lonline">@se4lonline</a> | 00000015443 |

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

tm is for text mining in R.

- RJSONIO

RJSONIO is a package that allows conversion to and from data in Javascript object notation (JSON) format. This allows R objects to be inserted into Javascript/ECMAScript/ActionScript code and allows R programmers to read and convert JSON content to R objects.

-tidyr 

tidyr makes it easy to tidy up your data. Neat data is easy to use data: easy to do munge (with dplyr), visualize (with ggplot2 or ggvis) and model (with hundreds of R modeling packages).

-jsonlite 

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

## Flowchart of Twitter Sentiment Analysis 

![Flowchart process 1](https://github.com/Liuzen/Frontier/blob/master/Image/Drawing1.jpg)

## Flowchart of New York Times Sentiment Analysis 

![Flowchart process 2](https://github.com/Liuzen/Frontier/blob/master/Image/Drawing2.jpg)

## Screenshots

### Top Trending Tweets Today

![SS1](https://github.com/Liuzen/Frontier/blob/master/Image/1.png)

### WordCloud

![SS2](https://github.com/Liuzen/Frontier/blob/master/Image/2.png)
![SS3](https://github.com/Liuzen/Frontier/blob/master/Image/3.png)

### Histogram

![SS4](https://github.com/Liuzen/Frontier/blob/master/Image/4.png)
![SS5](https://github.com/Liuzen/Frontier/blob/master/Image/5.png)
![SS6](https://github.com/Liuzen/Frontier/blob/master/Image/6.png)
![SS7](https://github.com/Liuzen/Frontier/blob/master/Image/7.png)

### Table

![SS8](https://github.com/Liuzen/Frontier/blob/master/Image/8.png)

### Top Tweeters

![SS9](https://github.com/Liuzen/Frontier/blob/master/Image/9.png)
![SS10](https://github.com/Liuzen/Frontier/blob/master/Image/10.png)

### Top Hashtags of User

![SS11](https://github.com/Liuzen/Frontier/blob/master/Image/11.png)

### Article

![SS12](https://github.com/Liuzen/Frontier/blob/master/Image/12.jpg)
![SS13](https://github.com/Liuzen/Frontier/blob/master/Image/13.jpg)

### Article Table

![SS14](https://github.com/Liuzen/Frontier/blob/master/Image/14.jpg)


