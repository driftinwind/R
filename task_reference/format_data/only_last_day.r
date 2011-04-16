require("quantmod")

getSymbols("GLD")

gld <- head(tail(GLD, n=2), n=1)

tail(gld)