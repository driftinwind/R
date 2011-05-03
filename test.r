require("quantmod")

getSymbols("SLV")
options <- getOptionChain("SLV")

head(options)


