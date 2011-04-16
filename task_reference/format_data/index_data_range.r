require("quantmod")

getSymbols("AAPL")

AAPL <- AAPL["2011::"]


head(AAPL)