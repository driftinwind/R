require("quantmod")

bank  <- c("AA","AXP","BA","BAC","CAT","CSCO",
           "CVX","DD","DIS","GE","HD","HPQ",            
           "IBM","INTC","JNJ","JPM","KFT",              
           "KO","MCD","MMM","MRK","MSFT","PFE",         
           "PG","T","TRV","UTX","VZ","WMT","XOM")       

coin <- getQuote(bank, what=yahooQF(c("Last Trade (Price Only)", "Change")))  

random <- function(change)
{
	 if ( change > 0 )
         return (1)
     else
         return (0)
}

coin$flip <-  mapply(random, coin[,3]) 

money <- sum(coin$flip)/length(coin$flip)*100

money