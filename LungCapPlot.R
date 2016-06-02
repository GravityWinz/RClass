rm(list=ls())

LungCapData <- read.delim("LungCapData.txt")

attach(LungCapData)

count <- table(Gender)

pct <- count/725

out.thing <-  barplot(pct,
        main = 'Percent Male vs Female ' , 
        xlab="Gender", ylab="%", las=TRUE, 
        names.arg = c("Chicks","Dudes"), 
        col = c("RED","GREEN") ) 
