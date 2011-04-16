require("quantmod")

getSymbols("SPY")

gld <- merge(SPY[,4], lag(SPY[,4],24))

gld <- na.locf(gld, na.rm=TRUE)

lag_diff <- function(x,y){
	
	pdiff <- (x - y)/y
	return(pdiff)
}

gld <- cbind(gld, apply(gld,1, function(x)lag_diff(x[1],x[2])))

change <- gld[,3]

png("~/Desktop/SPY_24_Days_Ago.png")

plot(change, main="SPY % Change From Close Today & Close 24 Days Ago")
