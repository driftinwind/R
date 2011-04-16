require(quantmod)

getSymbols("M2", src="FRED") 

plot(M2)