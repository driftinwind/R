# WARNING: THIS IS AN EXAMPLE OF WORST PRACTICES
# AND DOESN'T WORK ANYWAY



teetor <- function(x,y) {
	
	require("quantmod")
	require("tseries")
	
	golf <- function(x) {
	    deparse(substitute(x))
	  }
	
	hotel <- function(y) {
	    deparse(substitute(y))
	  }
	
	
	alpha <- getSymbols(golf(x),  auto.assign=FALSE)
	bravo <- getSymbols(hotel(y), auto.assign=FALSE)
	
	head(alpha)

    # t    <- as.data.frame(merge(alpha, bravo))
    #    	 
    #    m    <- lm(alpha ~ bravo + 0, data=t)                                                                    
    #    beta <- coef(m)[1]                                                                               
    #                                                                                                     
    #    X    <- t[,4]                                                                                    
    #    Y    <- t[,10]                                                                                   
    #                                                                                                     
    #    sprd <- X - beta*Y                                                                               
    #                                                                                                     
    #    ht   <- adf.test(sprd, alternative="stationary", k=0)                                            
    #                                                                                                     
    #    cat("Date range is", format(start(x)), "to", format(end(x)), "\n")                                          
    #    cat("Assumed hedge ratio is", beta, "\n")                                                                                                                                   
    #    cat("ADF p-value is", ht$p.value, "\n")                                                                                                                                 
    #                                                                                                       
    #    if (ht$p.value < 0.05)                                                                           
    #        cat("The spread is likely mean-reverting\n")                                                   
    #    else                                                                                             
    #        cat("The spread is not mean-reverting.\n")                                                     
    #     	                                                                                                                                                                   
 
}