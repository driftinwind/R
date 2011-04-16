require("quantmod")

getSymbols("GLD")

gld <- GLD[,c(-5,-6)]

tail(gld)