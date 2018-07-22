library(shiny)
library("Cairo")
library("wordcloud2")
library("shinythemes")
shinyUI(fluidPage(
 
  headerPanel("Twitter Sentiment Analysis"),
  theme = shinytheme("cyborg"),
  # Getting User Inputs
  
  sidebarPanel(
    
    textInput ("searchTerm","Enter hashtag to be searched with '#'",  "#"),
    sliderInput("maxTweets","Number of recent tweets to use for analysis",min=100,max=1000,value=100), # The max can, of course, be increased
     
    submitButton(text="Analyze")
    
    
    
  ),
  
  mainPanel(
    tabsetPanel(
      
      tabPanel("Top Trending Tweets Today",	
               selectInput("trendingTable","Choose location to extract trending tweets", c("Worldwide","Argentina","Australia", 
                                                                                           "Brazil", 
                                                                                           "Colombia", "Costa Rica", "Croatia",
                                                                                           "Denmark","Egypt",
                                                                                           "France", 
                                                                                           "Germany", "Iceland", "Iran", "Indonesia",
                                                                                           "Japan", "Panama", "Portugal",
                                                                                           "South Korea", "United States", 
                                                                                           "United Kingdom", "Uruguay") ),
      
               submitButton(text="Search"),    HTML("<div><h3> Top trending 
	hashtags on Twitter on above location </h3></div>"),
               tableOutput("trendtable"),
               HTML
               ("<div> </div>")
               ),
      
      
      tabPanel("WordCloud", wordcloud2Output('word'), br(),br(),br(), HTML
               ("<div><h3> Most Term Contributed to Positive Negative class
                 </h3></div>"), plotOutput("wordcloudtable")
               ),
                 
          
      tabPanel("Histogram",HTML
               ("<div><h3> Distribution of + and - sentiment about hashtag
                 </h3></div>"), plotOutput("histPos"), plotOutput("histNeg"), plotOutput("histScore"), br(),
               HTML("<div><h3>Depicting sentiment on a scale of 5</h3></div>"), plotOutput("piechart")
               ),
      
      tabPanel("Table",HTML( "<div><h3> Depicting sentiment in a tablular form on a scale of 5 </h3></div>"), tableOutput("tabledata"),
               HTML ("<div><h4> The table depicts the sentiment (positive, negative or neutral) of the tweets 
                     associated with the search hashtag by showing the score for each type of sentiment. </h4></div>")),
      
      
      tabPanel("Top Tweeters",HTML("<div><h3> Top 20 Tweeters of hashtag </h3></div>"),plotOutput("tweetersplot"), tableOutput("tweeterstable")),
      
      tabPanel("Top Hashtags of User", textInput("user", "Enter user name", "@"),submitButton(text="Search"), plotOutput("tophashtagsplot"),
               HTML("<div><h3> Hashtag frequencies in the tweets of the tweeter</h3></div>")
               ),
      tabPanel("Article", textInput("art", "Enter the search term"), 
               dateInput("begin", "Begin Date:", value = "2018-07-01"),
               dateInput("end", "End Date:", value = "2018-07-05"),
               
               submitButton(text="Go"), 
               HTML( "<div><h3>  network of section group based on the correlation of word counts between them </h3></div>"),
                      plotOutput("nyt"), br(), plotOutput("nytSent")
      ),
      
      tabPanel("Article Table", 

               tableOutput("nytTab")
      )
               
                 
    )
  )
))
              