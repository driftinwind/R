
gnat <- function(sym="GLD", fast=50, slow=200){
	
	require("quantmod")
	
	x               <- getSymbols(sym, auto.assign=FALSE)
	# x$perfect       <- abs(Hi(x) - Lo(x))
	
	x$fast          <- SMA(Cl(x), n=fast)                                         
	x$slow          <- SMA(Cl(x), n=slow)                                      
    x$signal        <- Lag(ifelse (x$fast > x$slow, 1, -1))
    x               <- na.omit(x)

	x$self_ret      <- dailyReturn(Cl(x), type="log")
	# x$perfect_ret   <- log((x$perfect/Cl(x)) + 1)
    x$bug_ret       <- dailyReturn(Cl(x), type="log")*x$signal                            
    
    x$self_eq       <- exp(cumsum(x$self_ret))  
    x$bug_eq        <- exp(cumsum(x$bug_ret))     
    x$alpha         <- exp(x$bug_eq - x$self_eq) - 1

    comment(x)      <- paste("This is the gnat algorithm for", sym, 
                             "with parameters of", fast, "and", slow)                              
    bug             <- paste(sym,"gnat", sep=".")    

    assign(bug, x, envir=.GlobalEnv)
}
