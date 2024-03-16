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


#obvious upward trend and slow decreasing acf. strong evidence of nonstationarity. Need to Transform the data
appl_close2 = transform(appl_close, diff_log_AAPL_Close = diff(log(AAPL.Close), lag = 1))
plot(appl_close2$diff_log_AAPL_Close, type = "l", main = "First Order Difference of Log-transformed Apple Stock")
acf(appl_close2$diff_log_AAPL_Close)
pacf(appl_close2$diff_log_AAPL_Close)

#Acf cuts off and the data looks way better than it did before. Now we can move onto the model smoothing and selection

