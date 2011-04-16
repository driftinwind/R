lemon_lime <- function(sym="SLV", expiry=24, pct=.1){
	
require("quantmod")                           
                                              
ticker <- getSymbols(sym, auto.assign=FALSE)[,6]                             

win  <- 0   
lose <- 0                                      
                                                                            
for(i in expiry:NROW(ticker))                                                                                
                                                    
if(as.numeric(ticker[i]) > (as.numeric(ticker[i-(expiry-1)])*pct + as.numeric(ticker[i-(expiry-1)])) )                                            
                                                                            
win <- win + 1                                                              
	                                                                        
winners <- win/(NROW(ticker)-expiry)                                                                                                      
                                                                            
for(i in expiry:NROW(ticker))                                                                                
                                                    
if(as.numeric(ticker[i]) < (as.numeric(ticker[i-(expiry-1)]) - as.numeric(ticker[i-(expiry-1)])*pct) )                                            
                                                                            
lose <- lose + 1                                                              
	                                                                        
losers <- lose/(NROW(ticker)-expiry)	 

weighted <- win/(win+lose)                
	                                                                                                
cat(   " Trading Days:               ", NROW(ticker)-expiry, "\n",
       "Winners:                    ", win, "\n",
       "Percentage of winning days: ", round(winners*100, digits=2), "\n",
       "Losers:                     ", lose, "\n",
       "Percentage of losing days:  ", round(losers*100, digits=2), "\n",
       "Weighted Coin Towards Winners? ", round(weighted, digits=2), "\n")                                   
}                                                 


      