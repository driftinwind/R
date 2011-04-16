require("quantmod")                           
                                              
getSymbols("SPY")                             
                                              
ticker <- SPY[,4]                             
                                              
win <- 0                                      
                                              
for(i in 22:NROW(ticker))                                                         
                                              
if(as.numeric(ticker[i]) > as.numeric(ticker[i-21]))                     
                                              
win <- win + 1                             
	                                                           
winners <- win/(NROW(ticker)-22)

winners