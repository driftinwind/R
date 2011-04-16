import <- function (x,y) {
	
	require(quantmod)
	
	delta   <- getSymbols(x, auto.assign=FALSE)
	echo    <- getSymbols(y, auto.assign=FALSE)

    foxtrot <- merge(echo, delta)

    head(foxtrot)
	
	
}


