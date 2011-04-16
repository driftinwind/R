require("quantmod")

trio <- getQuote("XLE;XLF;SPY", what=yahooQF("Last Trade (Price Only)"))  

class(trio)

trio

