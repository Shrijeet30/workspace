Amazon <- read.csv("C:/Amazon.csv")
library(tm)
corpus<-iconv(Amazon$ReviewBody,to="utf-8")
corpus<-Corpus(VectorSource(corpus))
corpus<-tm_map(corpus,tolower)
corpus<-tm_map(corpus,removePunctuation)
inspect(corpus[1:5])
corpus<-tm_map(corpus,removeNumbers)
inspect(corpus[1:5])
corpus<-tm_map(corpus,removeWords,stopwords('english'))
corpus<-tm_map(corpus,stripWhitespace)
tdm<-TermDocumentMatrix(corpus)
tdm
tdm<-as.matrix(tdm)
tdm[1:6,1:2]
library(wordcloud)
w<-sort(rowSums(tdm),decreasing = TRUE)
set.seed(222)
wordcloud(words = names(w),freq = w,max.words = 150,random.order = F,min.freq = 5,colors=brewer.pal
          
          (8,'Dark2'))
wordcloud(words = names(w),freq = w,max.words = 150,random.order = F,min.freq = 5,colors=brewer.pal
          
          (8,'Dark2'),rot.per=0.3)
Amazon <- read.csv("C:/Amazon.csv")
Amazon<-iconv(Amazon$ReviewBody,to="utf-8")
library(ggplot2)
library(scales)
library(reshape2)
library(dplyr)
install.packages("syuzhet")
library(syuzhet)
install.packages("lubridate")
library(lubridate)
Amazon <- read.csv("C:/Amazon.csv")
Amazon<-iconv(Amazon$ReviewBody,to="utf-8")
s<-get_nrc_sentiment(Amazon)
head(s)
Amazon[4]
barplot(colSums(s),las=2,col=rainbow(10),ylab='count',main='Sentiments for Amazon ear phones')