require("quantmod")

dow_list <- c("AA","AXP","BA","BAC","CAT","CSCO",
              "CVX","DD","DIS","GE","HD","HPQ",
              "IBM","INTC","JNJ","JPM","KFT",
              "KO","MCD","MMM","MRK","MSFT","PFE",
              "PG","T","TRV","UTX","VZ","WMT","XOM")

getSymbols(c(dow_list), from = "yesterday")  # loads the entire list into the environment

dow30 <- getQuote(c(dow_list), what=yahooQF("Last Trade (Price Only)"))

dow30