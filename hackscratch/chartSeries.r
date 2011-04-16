require("quantmod")

getSymbols("GLD")
getSymbols("SLV")
getSymbols("TLT")

GSR = GLD/SLV

# par(mfrow=c(2,2))

barChart (GLD, subset="2010",theme="white.mono", TA="addSMA()")               
barChart (SLV, subset="2010",theme="white.mono", TA="addSMA()")               
barChart (TLT, subset="2010",theme="white.mono", TA="addSMA()")               
barChart (GSR, subset="2010",theme="white.mono", TA="addSMA()")


