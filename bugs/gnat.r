
gnat <- function(sym="GLD", fast=50, slow=200){
	
	require("quantmod")
	
	x               <- getSymbols(sym, auto.assign=FALSE)
	x$fast          <- SMA(Cl(x), n=fast)                                         
	x$slow          <- SMA(Cl(x), n=slow)                                      
    x$signal        <- Lag(ifelse (x$fast > x$slow, 1, -1))
   
    x               <- na.omit(x)
    x$log_ret       <- dailyReturn(Cl(x), type="log")*x$signal                            
    x$equity        <- exp(cumsum(x$log_ret))     

    comment(x)      <- paste("This is the gnat algorithm for", sym, 
                             "with parameters of", fast, "and", slow)                              
    bug             <- paste(sym,"gnat", sep=".")    

    assign(bug, x, envir=.GlobalEnv)
}

