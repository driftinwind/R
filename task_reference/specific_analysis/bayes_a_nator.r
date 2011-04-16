bayes_a_nator <- function(sym1, sym2) {
	
	require ("quantmod")

# FIRST get the objects (price series returns) correctly formatted

    x    <- getSymbols(sym1, auto.assign=FALSE)                                  
    y    <- getSymbols(sym2, auto.assign=FALSE)                                  
                                                                                 
    x    <- Delt(x[,4])                                                   
    y    <- Delt(y[,4])                                                    
                                                                                 
    x    <- na.locf(x, na.rm=TRUE)                                        
    y    <- na.locf(y, na.rm=TRUE)                                                
                                                                                    
    xy   <- cbind(x,y)                                       
         
# SECOND: get the positive values isolated 
	
    x.num   <- 0
    xy.num  <- 0  
    x_y.num <- 0  
  
    for(i in 1:NROW(x))
    if (x[i] > 0)
  
    x.num     <- x.num + 1             # x.num
		
	for(i in 1:NROW(xy))
	if (xy[i,1] > 0 &                                    
	    xy[i,2] > 0)                                      
	                                                        
	xy.num    <- xy.num + 1             # xy.num     
		
	for(i in 1:NROW(xy))
	if (xy[i,1] < 0 &&                                    
	    xy[i,2] > 0)                                      
	                                                        
	x_y.num   <- x_y.num + 1            # x_y.num       
	                                                               	
                                        
# THIRD derive other important values with trivial algebra

# but first, some ASCII art
                     
#                     /-- x.up.y.up
#        /--- x.up__/
#      /            \
# ___/               \___ x.up.y.dn
#     \ 
#      \              /-- x.dn.y.up
#       \___  x.dn__/
#                   \
#                    \___ x.dn.y.dn
#

	x.up       <- x.num/NROW(x) 
	x.dn       <- 1 - x.up    
	
	x.up.y.up  <- xy.num/x.num  
	x.up.y.dn  <- 1 - x.up.y.up
	
	x.dn.y.up  <- x_y.num/(NROW(x)-x.num)
	x.dn.y.dn  <- 1 - x.dn.y.up
	
# FOURTH implement Bayes Theorem

# P(x|y) is the standard Probability notation that reads
# "Probability of x given y"

# The diagram's equivalent is references inside <>

#                    P(y.up | x.up)  * P(x.up)            <x.up.y.up>  *  <x.up> 
# P(x.up | y.up)  = ___________________________     =    _________________________
#	                        P(y.up)                       <(x.up * x.up.y.up) + (x.dn * x.dn.y.up)>

# We know what x.up is unconditionally, but what is it if we have
# super secret information that y is up?

	nugget <- (x.up.y.up * x.up)/((x.up.y.up * x.up) + (x.dn.y.up * x.dn))

# FIFTH return bayesian wisdom (along with some sanity checking)
	
	cat(" Probability of "   , sym1, " going up : "                       ,round(x.up     *100, digits=2), "\n", 
	    "Probability of "   , sym1, " going dn : "                        ,round(x.dn     *100, digits=2), "\n",  
	    "Probability of "   , sym1, " going up and", sym2, " going up : " ,round(x.up.y.up*100, digits=2), "\n",
	    "Probability of "   , sym1, " going up and", sym2, " going dn : " ,round(x.up.y.dn*100, digits=2), "\n",
	    "Probability of "   , sym1, " going dn and", sym2, " going up: "  ,round(x.dn.y.up*100, digits=2), "\n",
	    "Probability of "   , sym1, " going dn and", sym2, " going dn: "  ,round(x.dn.y.dn*100, digits=2), "\n",
	    "Probability that " , sym1, " goes up when", sym2, " goes up: "   ,round(nugget   *100, digits=2), "\n")
		                                                                                
}                                                                                       