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
plot(y=appl_close$AAPL.Close,x = appl_close$Date, main="Apple Stock",grid())

#Check Stationarity
appl_ts = ts(data=appl_data$AAPL.Close,frequency=12)
class(appl_ts)
plot(appl_ts)

acf(appl_close)
pacf(appl_close)

#obvious upward trend and slow decreasing acf. strong evidence of nonstationarity. Need to Transform
appl_close2 = transform(appl_close, AAPL.Close = log(AAPL.Close))
tsplot(appl_close2, main="Apple Stock", pch = 20)
