lemon <- function(sym="SPY", expiry=24, pct=.03){
	
require("quantmod")                           
                                              
ticker <- getSymbols(sym, auto.assign=FALSE)                             
                                              
ticker <- ticker[,4]                             
                                              
lose <- 0                                      
                                                                            
for(i in expiry:NROW(ticker))                                                                                
                                                    
if(as.numeric(ticker[i]) < (as.numeric(ticker[i-(expiry-1)]) - as.numeric(ticker[i-(expiry-1)])*pct) )                                            
                                                                            
lose <- lose + 1                                                              
	                                                                        
losers <- lose/(NROW(ticker)-expiry)	                 
	                                                                                                
cat(   " Trading Days:               ", NROW(ticker)-expiry, "\n",
       "Losers:                    ", lose, "\n",
       "Percentage of losing days: ", round(losers*100, digits=2), "\n")                                   
}                                                 
