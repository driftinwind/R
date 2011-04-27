
cricket <- function(sym="GLD", fast=50, slow=200){
	
	require("quantmod")
	
	x               <- getSymbols(sym, auto.assign=FALSE)
	x$fast          <- SMA(Cl(x), n=fast)                                         
	x$slow          <- SMA(Cl(x), n=slow)                                      
    x$signal        <- Lag(ifelse (x$fast > x$slow, 1, -1))
   
    x               <- na.omit(x)
    x$log_ret       <- dailyReturn(Cl(x), type="log")*x$signal                            
    x$equity        <- exp(cumsum(x$log_ret))                                           
		
    bug             <- paste(sym,"cricket", fast, slow, sep=".")    
    
    assign(bug, x, envir=.GlobalEnv)
}

# cricket <- function(sym="GLD", fast=50, slow=200, env = .GlobalEnv){
# 	
# 	require("quantmod")
# 	
# 	x           <- getSymbols(sym, auto.assign=FALSE)                                          	
# 	x$fast      <- SMA(( x[,4] ), n=fast)                                         
# 	x$slow      <- SMA(( x[,4] ), n=slow)                                        
# 
# 	position 	<- ifelse (x$fast > x$slow, 1, -1)                           
# 
# 	position    <<- na.locf(position, na.rm=TRUE)    
# 
# 	return(position)
# 	
# }
# 
# cricket <- function(x, fast=50, slow=200){
# 	
# 	x$fast          <- SMA(( x[,4] ), n=fast)                                         
# 	x$slow          <- SMA(( x[,4] ), n=slow)                                        
# 
#     position    	<- ifelse (x$fast > x$slow, 1, -1) 
#     names(position) <- "signal"
#     
#     cricket.silver  <<- position    
# }


# cricket <- function(sym="GLD", fast=seq(40, 60, 11), slow=seq(150, 250, 50)){
# 	
# 	require("quantmod")
# 	# for(i in seq(5, 15, 5))
# 	#   for(j in seq(50, 80, 15))
# 	# 
# 	# {
# 	# 	GLD$fast     <- SMA(Cl(GLD), n=i)     
# 	# 	GLD$slow     <- SMA(Cl(GLD), n=j)         
# 	# 
# 	# 	golden_cross <- Lag(ifelse(GLD$fast > GLD$slow, 1, -1))
# 	# 	golden_cross <- na.locf(golden_cross, na.rm=TRUE)
# 	# 	
# 	x               <- getSymbols(sym, auto.assign=FALSE)
# 	
# 	for(i in fast)
# 	  for(j in slow){
# 	x$fast          <- SMA(( x[,4] ), n=i)                                         
# 	x$slow          <- SMA(( x[,4] ), n=j)                                        
# 
#     nam             <- paste(sym,"cricket", fast, slow, sep=".")    
# 
#     position    	<- ifelse (x$fast > x$slow, 1, -1) 
#     names(position) <- "signal"
#     
#     assign(nam, position, envir=.GlobalEnv)}
# }