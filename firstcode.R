install.packages("tidyverse")
library(tidyverse)

install.packages("quantmod")
library(quantmod)

getSymbols('AAPL',src = 'yahoo')

install.packages("data.table")
library(data.table)

aapl_data=as.data.table(AAPL)
names(aapl_data)[0] = c('Date')

aapl_data['date'] = as.Date(aapl_data$date, "%d-%b-%y")
