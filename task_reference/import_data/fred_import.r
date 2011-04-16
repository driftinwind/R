require(quantmod)

getSymbols("DGS10 ; MORTGAGE30US", src="FRED") 

tail(DGS10)
tail(MORTGAGE30US)

chartSeries(MORTGAGE30US)