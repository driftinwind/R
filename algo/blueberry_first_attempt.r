blueberry <- function(sym="SLV", my_lag=24, file="~/Desktop/24_days_ago.png"){
	
	require("quantmod")

	ticker <- getSymbols(sym, auto.assign=FALSE)
	
	# ticker <- adjustOHLC(ticker, use.Adjusted=T)

	ticker <- merge(ticker[,6], lag(ticker[,6],my_lag))

	ticker <- na.locf(ticker, na.rm=TRUE)

	lag_diff <- function(x,y){                           
		pdiff <- (x - y)/y                          
		return(pdiff)                               
	}                                               
                                                    
	ticker <- cbind(ticker, apply(ticker,1, function(x)lag_diff(x[1],x[2])))
                                                    
	change <- ticker[,3]                            
	                                                
	dens   <- density(change)                       
                                                    
	png(file)                                       
                                                    
	# plot(change,          main="% Change From Close Today & Close 24 Days Ago")
	# hist(change,          main="% Change From Close Today & Close 24 Days Ago")
	plot(dens, main="% Change From Close Today & Close 24 Days Ago")
	polygon(dens, col="blue")                       
		                                            
	dev.off()                                       
                                                    
}