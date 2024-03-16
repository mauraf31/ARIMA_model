install.packages("tidyverse")
library(tidyverse)

install.packages("quantmod")
library(quantmod)

getSymbols('AAPL',src = 'yahoo')
head(AAPL)
dim(AAPL)

AAPL_clean=na.omit(AAPL)
dim(AAPL_clean)
