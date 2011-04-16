# get() method instead of do.call() method


money <- function(x) {
		
     require("quantmod")                                                                                                                          
                                                                                                                                                  
     getSymbols(x)                                                                                                                                
                                                                                                                                                     
     c             <- get(x[,4])                                                                                                                        
     # c50           <- SMA(gets(c, n=50))                                                                                                                
     #     c200          <- SMA(gets(c, n=200))                                                                                                               
     #                                                                                                                                                 
     #    last_c        <- tail(get(c), n=1)                                                                                                           
     #    last_c50      <- tail(get(c50), n=1)                                                                                                         
     #    last_c200     <- tail(get(c200), n=1)                                                                                                        
     #                                                                                                                                                 
     #    if (last_c > last_c50 && last_c > last_c200 && last_c50>last_c200)                                                                           
     #       { print("I am a bull market") }                                                                                                           
     #    else                                                                                                                                         
     #       {  print("I am NOT a bull market") }                                                                                                      
                                                                                                                                                  
}                                                                                                                                                 

money("GLD")