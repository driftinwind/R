require(quantmod)

getSymbols("XLF")

xlf <- getQuote("XLF", what=yahooQF("Last Trade (Price Only)"))

XLF <- head(tail(XLF, n=2), n=1)

XLF <- XLF[,4]

super <- merge(xlf,XLF)

super