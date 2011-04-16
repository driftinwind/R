require("quantmod")

bank  <- c("AA","AXP","BA","BAC","CAT","CSCO",
           "CVX","DD","DIS","GE","HD","HPQ",            
           "IBM","INTC","JNJ","JPM","KFT",              
           "KO","MCD","MMM","MRK","MSFT","PFE",         
           "PG","T","TRV","UTX","VZ","WMT","XOM")  

money <- c(123, 232, 232, 222, 111, 231, 323, 123)     

# coin <- getQuote(bank, what=yahooQF(c("Last Trade (Price Only)", "Change")))  
# 
# money <- coin$Change

# ptm <- proc.time()

random <- function(money){
	
	for (i in 1:length(money))
					
		if (money[i] > 0)                                 
		money[i] <- money[i] + 1
	return(money)
}


# money
# proc.time() - ptm

