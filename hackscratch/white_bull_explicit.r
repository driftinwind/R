# The require("quantmod") is commented out to show where these functions come from


# This whole thing does not work, 
# and it's not worth it to figure out why right now

white_bull <- function(ticker) {
	
	# require("quantmod")
    
    x <- quantmod::getSymbols(ticker, auto.assign=FALSE)
     
    c             <- x[,4]                                                       
    c50           <- TTR::SMA(c, n=50)                                           
    c200          <- TTR::SMA(c, n=200)                                          
                                                                                                                                                  
    last_c        <- base::tail(c, n=1)                                                                                                                      
    last_c50      <- base::tail(c50, n=1)                                                                                                               
    last_c200     <- base::tail(c200, n=1)     
                                         
                                                                                                               
    if (last_c > last_c50 && last_c > last_c200 && last_c50 > last_c200)                                                                                 
       { print("I am a bull market") }                                                                                                                 
    else                                                                                                                                                     
       {  print("I am NOT a bull market") }                                                                                                                  
                                                                          		
}


white_bull("C")