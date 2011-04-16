marketMode <- function() 
{	
	require("quantmod")
	
	getSymbols("GLD")
	
 	# tail(x, n=1)
 	# 	
 	# 	x_50  <- SMA(x[,"GLD.Close"], n=50)
 	# 	x_200 <- SMA(x[,"GLD.Close"], n=200)
 	# 	
	
	
	SMA_200 <- SMA(GLD[,4], 200)
	SMA_50  <- SMA(GLD[,4], 50)
	SMA_200
	SMA     <- merge(GLD[,4], SMA_50, SMA_200)

	ll <- tail(SMA_200, n=1)
	kk <- tail(SMA_50, n=1)
	mm <- tail(GLD[,4], n=1)
	
	
	kk
	ll
	mm
	
	
	
# 		
# 		    if (close > tail(x_50, n=1) && close > x_200 && x_50 > x_200)
# 		{ cat("I am a bull") }
# 		
# 		else
# 		{ cat ("I am NOT a bull") }
}

marketMode()