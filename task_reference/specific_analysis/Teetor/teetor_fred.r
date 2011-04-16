teetor_fred <- function(x,y) {
	
	require("quantmod")
	require("tseries")
	
	k <- getSymbols(x,src="FRED", auto.assign=FALSE)
	l <- getSymbols(y,src="FRED", auto.assign=FALSE)

    kilo <- k["1999::"]
    lima <- l["1999::"]

    kilo <- na.locf(kilo, na.rm=TRUE)
    lima <- na.locf(lima, na.rm=TRUE)

    t    <- as.data.frame(merge(kilo, lima))
    	 
    m    <- lm(kilo ~ lima + 0, data=t)                                                                    
    beta <- coef(m)[1]                                                                                     
                                                                                                           
    X    <- t[,1]                                                                                          
    Y    <- t[,2]                                                                                         
                                                                                                           
    sprd <- X - beta*Y                                                                                     
                                                                                                           
    ht   <- adf.test(sprd, alternative="stationary", k=0)                                                  
                                                                                                           
    # cat("Date range is", format(start(kilo)), "to", format(end(kilo)), "\n")                                                
    # cat("Assumed hedge ratio is", beta, "\n")                                                                                                                                         
    # cat("ADF p-value is", ht$p.value, "\n")                                                                                                                                       
                                                                                                             
    if (ht$p.value < 0.05)                                                                                 
        cat("May be worth looking into", x, y, " more closely. \n")                                                         
    else                                                                                                   
        cat("Ahh, nope.\n") 

    # head(t)                                                        
                                                                                                                                                                               
     
}