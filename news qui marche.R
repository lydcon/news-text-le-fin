# les nouvelles

library (tm)#for cmpariring diff data sets and permorning mutliple functions
library(reshape)
library(ggplot2)
library(NLP)
library(tm)
library(wordcloud)


nouvelle<-read.csv(file.choose(), header=T, stringsAsFactors= F) #for loading the data XPO NEWS, TEXT STRINGS AND NOT AS FACTORS

nouvelle

#ensemble

news<-paste(nouvelle, collapse=" ")
news

#et puis corpus et le vector
XPO_vec<-VectorSource(news)
XPO_vec
CorpXPO<-Corpus(XPO_vec)
CorpXPO

#on lave avec tm map: multiurpose

CorpXPO <- tm_map(CorpXPO, content_transformer(tolower))#small letters
CorpXPO <- tm_map(CorpXPO, removePunctuation)#removes the punctuations
CorpXPO <- tm_map(CorpXPO, stripWhitespace)#turns to single space
CorpXPO <- tm_map(CorpXPO, removeWords, stopwords("english"))

#Making a doc term matrix, where the sparce matrix is different from the usual matrix_
#because it doesnt have rows and columns

dtm<-DocumentTermMatrix(CorpXPO)
dtm
dtmMat<-as.matrix(dtm)
dtmMat#counts


#trouve les plus freqent terms
FreqTerms<-colSums(dtmMat)
str(FreqTerms)
FreqTerms
FreqSort<- sort(FreqTerms, decreasing=T)#Sorting in descending order, from highest to lowest
str(FreqSort)
FreqSort


#load wordcloud here if not yet loaded
library(wordcloud)

words <-names(FreqSort)
words
head(words)
wordcloud(words[1:200], FreqSort[1:200])#vec with all the words and how frequent that they all appear


