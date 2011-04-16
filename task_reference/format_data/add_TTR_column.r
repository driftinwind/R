require(quantmod)

getSymbols("GLD")

GLD$MA_30 = SMA(Cl(GLD), 30)

tail(GLD)