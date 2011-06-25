
answers <- function(sym="GLD", future=-1, per=0.012){
	
	require("quantmod")
	
	x               <- getSymbols(sym, auto.assign=FALSE)
	x$ret           <- dailyReturn(x) 
	x$ans           <- lag(x$ret, k=future)    
	x               <- x[,8]   
	
  x$dir[x$ans >= 0]    <- 1                        
  x$dir[x$ans <  0]    <- 0                        
  x$mag[abs(x$ans) >  per]    <- 1                        
  x$mag[abs(x$ans) <  per]    <- 0                        

  food            <- paste(sym,"answers",   sep=".")    
    
  assign(food, x, envir=.GlobalEnv)
}
