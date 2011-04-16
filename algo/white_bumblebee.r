

white_bumblebee <- function(ticker) {
	
	require("quantmod")
    
    x                        <- getSymbols(ticker, auto.assign=FALSE)           
                                                                                
    close                    <- x[,4]                                               
                                                                                
    fast                     <- BBands( close, n=10, sd=0.5)                      
    slow                     <- BBands( close, n=30, sd=0.5)                      
                                                                                  
    fast_dn                  <- fast[,1]                                           
    fast_av                  <- fast[,2]                                           
    fast_up                  <- fast[,3]                                           
                                                                              
    slow_dn                  <- slow[,1]                                           
    slow_av                  <- slow[,2]                                           
    slow_up                  <- slow[,3]                                           
                                                                                                                                                                             
    last_c                   <- tail(close, n=1)  
                                                                                                      
    last_fast_dn             <- tail(fast_dn, n=1)                                                                                                        
    last_fast_av             <- tail(fast_av, n=1)                                                                                                        
    last_fast_up             <- tail(fast_up, n=1)                                                                                                        

    last_slow_dn             <- tail(slow_dn, n=1)                                    
    last_slow_av             <- tail(slow_av, n=1)                                    
    last_slow_up             <- tail(slow_up, n=1)                                       
                                                                              
    yday_c                   <- head(tail(close, n=2))                                                                                                             

    yday_fast_dn             <- head(tail(fast_dn,   n=2))                                                                                                      
    yday_fast_av             <- head(tail(fast_av,   n=2))                                                                                                      
    yday_fast_up             <- head(tail(fast_up,   n=2))                                                                                                      

    yday_slow_dn             <- head(tail(slow_dn,   n=2))                           
    yday_slow_av             <- head(tail(slow_av,   n=2))                           
    yday_slow_up             <- head(tail(slow_up,   n=2))                           
                                                                                                                                                                                                                                                                                           		
}                                 
