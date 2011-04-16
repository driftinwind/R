bar_color <- function(ticker) {
	
	require("quantmod")
    
    x <- getSymbols(ticker, auto.assign=FALSE)
     
    open        <- x[,1]                                                             
    close       <- x[,4]                                                             
                                         
    last_open   <- tail(open,  n=1)                                                                                                                            
    last_close  <- tail(close, n=1)                                                                                                                            
   
    if       (open > close)    
               -100
                                                                                                    
    else if  (open < close)                                                                                                                                                     
               100  
   
     else       0                                     
                                                                                                               
    # if       (last_open > last_close)    
    #               -100
    #                                                                                                    
    #    else if  (last_open < last_close)                                                                                                                                                     
    #               100  
    #   
    #     else       0    
                                                          		
}

bar_color("TLT")

apply