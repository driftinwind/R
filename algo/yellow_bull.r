# adding a definition of a bear market


yellow_bull <- function(ticker) {
	
	require("quantmod")
    
    x <- getSymbols(ticker, auto.assign=FALSE)
     
    c             <- x[,4]                                                       
    c50           <- SMA(c, n=50)                                           
    c200          <- SMA(c, n=200)                                          
                                                                                                                                                  
    last_c        <- tail(c, n=1)                                                                                                                      
    last_c50      <- tail(c50, n=1)                                                                                                               
    last_c200     <- tail(c200, n=1)     
                                         
                                                                                                               
    if (last_c > last_c50 && last_c > last_c200 && last_c50 > last_c200)                                                                                 
       { print("I am a bull market") }  

    else if (last_c < last_c50 && last_c < last_c200 && last_c50 < last_c200)                                                                                 
	   { print("I am a bear market") }                                                                                                               

    else                                                                                                                                                     
       { print("I am NOT a bull or bear market") }                                                                                                                  
                                                                          		
}
yellow_bull("TLT")
yellow_bull("^VIX")
yellow_bull("F")
yellow_bull("IBM")
