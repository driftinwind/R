blueberry <- function(sym="SLV", my_lag=24, file="~/Desktop/24_days_ago.png"){
	
	require("quantmod")

	t <- getSymbols(sym, auto.assign=FALSE)[,6]  
	
    change = (t - lag(t, 24)) / lag(t, 24)
    change <- change[!is.na(change)]
			
	dens   <- density(change)                                                                                       
			                                                                                                                
	png(file)                                                                                  
	                                                                                           
	plot(dens, main="% Change From Close Today & Close 24 Days Ago")                                                        
	polygon(dens, col="blue")                                                                                               
	                                                                                                                        
	dev.off()                                                                                                               
		                                                                                                                
}