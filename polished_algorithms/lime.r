lime <- function(sym="SPY", expiry=24, pct=.03){
	
require("quantmod")                           
                                              
ticker <- getSymbols(sym, auto.assign=FALSE)                             
                                              
ticker <- ticker[,4]                             
                                              
win <- 0                                      
                                                                            
for(i in expiry:NROW(ticker))                                                                                
                                                    
if(as.numeric(ticker[i]) > (as.numeric(ticker[i-(expiry-1)])*pct + as.numeric(ticker[i-(expiry-1)])) )                                            
                                                                            
win <- win + 1                                                              
	                                                                        
winners <- win/(NROW(ticker)-expiry)	                 
	                                                                                                
cat(   " Trading Days:               ", NROW(ticker)-expiry, "\n",
       "Winners:                    ", win, "\n",
       "Percentage of winning days: ", round(winners*100, digits=2), "\n")                                   
}                                                 
