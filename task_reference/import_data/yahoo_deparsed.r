#  WARNING : THIS DOES NOT WORK



import <- function (x,y) {
	
	require(quantmod)
	
	golf <- function(x) {
	    mike <- deparse(substitute(x))
	    return(mike)
	  }
	
	hotel <- function(y) {
	    deparse(substitute(y))
	  }
	
	
	# echo     <- getSymbols(golf(x),  auto.assign=FALSE)
	# 	delta    <- getSymbols(hotel(y), auto.assign=FALSE)
	# 
	#     foxtrot  <- merge(echo, delta)
	# 
	#     head(foxtrot)
	
	
}