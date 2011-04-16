require("quantmod")

intra <- getQuote("AA;MMM", what=yahooQF("Last Trade (Price Only)")) #get intraday quote

getSymbols("AA;MMM") # get EOD data

AA  <- AA[,4]  # only the close
MMM <- MMM[,4]

AA  <- head(tail(AA, n=2), n=1)  # only yesterday
MMM <- head(tail(MMM, n=2), n=1)

AA  <- as.vector(AA)  # prepare for merge into data.frame
MMM <- as.vector(MMM)

EOD <- rbind(AA, MMM)

intra$yday <- EOD

intra

#introduce a binary function

latest <- function(last,close)

{
	value = (last-close)

		if ( value > 0 )
         return (1)
     else
         return (0)
	
}

intra <- cbind(intra, mapply( latest, intra[,2], intra[,3]))

intra

apply(intra$yday, 2, function(x, y) sum(x) / y, y=length(intra$yday))  # the percent generator
