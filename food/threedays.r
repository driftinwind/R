future <- function(sym="GLD"){
	
	require("quantmod")
	
	x          <- getSymbols(sym, auto.assign=FALSE)                   
	x$ret      <- dailyReturn(x, type="log")                           
	x$ago.1    <- lag(x$ret, k=1)           
	x$ago.2    <- lag(x$ret, k=2)           
	x$ago.3    <- lag(x$ret, k=3)           
	x$ago.4    <- lag(x$ret, k=4)   
	
	
  #         note that next.5 is the 1-day return after the start of a 4-day event
  #         next.8 is what happens after four-days later after 4-days of something else happens
  #  so if a four-day rally starts, then next.8 is the return on the fourth day after the end of the rally
	x$next.1   <- lag(x$ret, k=-1)            
	x$next.2   <- lag(x$ret, k=-2)            
	x$next.3   <- lag(x$ret, k=-3)            
	x$next.4   <- lag(x$ret, k=-4)      
	x$next.5   <- lag(x$ret, k=-5)      
	x$next.6   <- lag(x$ret, k=-6)      
	x$next.7   <- lag(x$ret, k=-7)      
	x$next.8   <- lag(x$ret, k=-8)      
	
  #    get returns tomorrow, 2-days and 3-days into the future
  
	x$in.1     <-    exp(x$next.1)-1
  x$in.2     <-    exp(x$next.1 + x$next.2)-1
  x$in.3     <-    exp(x$next.1 + x$next.2 + x$next.3)-1
  x$in.4     <-    exp(x$next.1 + x$next.2 + x$next.3 + x$next.4)-1                 
  x$in.5     <-    exp(x$next.1 + x$next.2 + x$next.3 + x$next.4 + x$next.5)-1                 
  x$in.6     <-    exp(x$next.1 + x$next.2 + x$next.3 + x$next.4 + x$next.5 + x$next.6)-1                 
  x$in.7     <-    exp(x$next.1 + x$next.2 + x$next.3 + x$next.4 + x$next.5 + x$next.6 + x$next.7)-1                 
  x$in.8     <-    exp(x$next.1 + x$next.2 + x$next.3 + x$next.4 + x$next.5 + x$next.6 + x$next.7 + x$next.8)-1                 

  food       <- paste(sym,"future.returns",   sep=".")    
    
  assign(food, x, envir=.GlobalEnv)
}
