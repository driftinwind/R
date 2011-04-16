require(quantmod)
require(gregmisc) # using to rename an obscene vector to something manageable 

getSymbols("XLF")

xlf <- getQuote("XLF", what=yahooQF("Last Trade (Price Only)"))

XLF <- head(tail(XLF, n=2), n=1) # make sure it's yesterday -- not sure about this

XLF <- XLF[,4]  # close data only

super <- merge(xlf,XLF)  # only data so far

latest <- function(last,close)

{
	value = (last-close)

		if ( value > 0 )
         return (1)
     else
         return (0)
}

# choose method 1 or method 2

# duper <- cbind(super, apply(super,1, function(x)latest(super[,2],super[,3]))) # method 1

duper <- cbind(super, mapply( latest, super[,2], super[,3])) # method 2

# first attempt to change the name of obscene vector

# duper <- as.data.frame(duper)
# 
# class(duper)
# 
# duper
# 
# duper$V4 

# second attempt

duper <- rename.vars(duper, "mapply(latest, super[, 2], super[, 3])", "now")

duper