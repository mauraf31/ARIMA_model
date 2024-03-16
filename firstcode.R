install.packages("tidyverse")
library(tidyverse)

install.packages("quantmod")
library(quantmod)

getSymbols('AAPL',src = 'yahoo')
head(AAPL)
dim(AAPL)

library(data.table)
appl_data = as.data.table(AAPL)
names(appl_data)[1] = c("Date")
head(appl_data)

appl_close = appl_data[,c(1,5)]


library(TSA)
library(astsa)
tsplot(appl_close, main="Apple Stock", type="o", pch=19, ylab="")

