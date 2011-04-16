raisin <- function(x,y) {
	
	require("quantmod")
	require("tseries")
	
	kilo <- getSymbols(x, auto.assign=FALSE)
	lima <- getSymbols(y, auto.assign=FALSE)
	
    t    <- as.data.frame(merge(kilo, lima))
    	 
    m    <- lm(kilo ~ lima + 0, data=t)                                                                    
    beta <- coef(m)[1]                                                                                     
                                                                                                           
    X    <- t[,4]                                                                                          
    Y    <- t[,10]                                                                                         
                                                                                                           
    sprd <- X - beta*Y                                                                                     
                                                                                                           
    ht   <- adf.test(sprd, alternative="stationary", k=0)                                                  
                                                                                                           
    cat("Date range is", format(start(kilo)), "to", format(end(kilo)), "\n")                                                
    cat("Assumed hedge ratio is", beta, "\n")                                                                                                                                         
    cat("ADF p-value is", ht$p.value, "\n")                                                                                                                                       
                                                                                                             
    if (ht$p.value < 0.05)                                                                                 
        cat("The spread is likely mean-reverting\n")                                                         
    else                                                                                                   
        cat("The spread is NOT mean-reverting.\n") 
    
}