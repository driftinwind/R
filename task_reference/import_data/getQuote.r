require("quantmod")

# getQuote("AAPL")
# getQuote("QQQQ;SPY;^VXN",what=yahooQF(c("Bid","Ask")))
# standardQuote()
# yahooQF()

trio <- getQuote("XLE;XLF;SPY")  

class(trio)

trio



