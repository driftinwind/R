bullAmI <- function(x) {
	 
	require("quantmod")
	
	last <- function(xx) { tail(xx, n = 1) }
	
	getSymbols("GLD")
	
	twoHun <- SMA(GLD[,4], 200)
	fifty  <- SMA(GLD[,4], 50)
	
	g      <- last(GLD[,4])
	t      <- last(twoHun)
	f      <- last(fifty)

	if (g>t && g>f && f>t) {cat("I'm tall")}
	else {cat("I'm not")}
	
	
}

bullAmI()



