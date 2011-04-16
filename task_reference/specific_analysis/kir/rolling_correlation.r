require(quantmod)
require(PerformanceAnalytics)

#get currency rate and stock data from the FED FRED data series
getSymbols("DGS10",src="FRED") #load Fed 10y rate
getSymbols("DTWEXM",src="FRED") #load Fed Dollar
getSymbols("DTWEXO",src="FRED") #load Fed Dollar Other
getSymbols("SP500",src="FRED") #load Fed SP500

returns<-merge(monthlyReturn(to.monthly(DGS10/DTWEXM)),monthlyReturn(to.monthly(SP500)))

returns <- na.omit(returns)

corSP10USD<-runCor(returns["1973::2011-02",1],returns["1973::2011-02",2],n=6)

chartSeries(corSP10USD,theme='white',name="S&P 500 Rolling 1y Correlation with US$ and US10y Rates")