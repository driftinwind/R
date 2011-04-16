bar_color <- function(ticker) {
	
	require("quantmod")
    
    x <- getSymbols(ticker, auto.assign=FALSE)
     
    open        <- x[,1]                                                             
    close       <- x[,4]                                                             
                                         
    last_open   <- tail(open,  n=1)                                                                                                                            
    last_close  <- tail(close, n=1)                                                                                                                            
   
                                         
                                                                                                               
    if       (last_open > last_close)    
               "Red Bar"
                                                                                                    
    else if  (last_open < last_close)                                                                                                                                                     
               "Green Bar"   
   
     else       "Doji Bar"    
                                                          		
}

bar_color("TLT")