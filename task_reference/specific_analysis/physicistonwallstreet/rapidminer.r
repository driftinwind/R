library(quantmod)
library(TTR)
library(PerformanceAnalytics)

# pull IBM data from Yahoo Finance
getSymbols("IBM",from="2009-01-01")

# Introduce RSI Indicator
IBM$RSI2 = RSI(Cl(IBM), 2)

#Introduce Eponential Moving Average indicator
IBM$EMA7=EMA(Cl(IBM), n=7, wilder=FALSE, ratio=NULL)
IBM$EMA50=EMA(Cl(IBM), n=50, wilder=FALSE, ratio=NULL)
IBM$EMA200=EMA(Cl(IBM), n=200, wilder=FALSE, ratio=NULL)

#Introduce MACD indicator
IBM$MACD26=MACD(Cl(IBM), nFast=12, nSlow=26, nSig=9)

#Introduce ADX indicator
IBM$ADX14=ADX(IBM, n=14)

#results <-transform(IBM,RSI.IBM=RSI(Cl(IBM), 2),RETURN=ret ,TIME=as.character(index(IBM)))
# remove 2009 in order to avoid NaN from EMA indicators 2010 evaluation
# To maintain time it is necessary to conver in texts
results <-transform(IBM["2010-01-01::"],TIME=as.character(index(IBM["2010-01-01::"])))

tail(results)

tail(IBM)