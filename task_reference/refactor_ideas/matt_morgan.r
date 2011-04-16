t = getSymbols(sym, auto.assign=FALSE)[,4]
change = (t - lag(t, 24)) / lag(t, 24); change[!is.na(change)]


ticker <- getSymbols(sym, auto.assign=FALSE)
ticker <- merge(ticker[,6], lag(ticker[,6],24))
ticker <- na.locf(ticker, na.rm=TRUE)
lag_diff <- function(x,y){
	pdiff <- (x - y)/y
	return(pdiff)
}
ticker <- cbind(ticker, apply(ticker,1, function(x)lag_diff(x[1],x[2])))
change <- ticker[,3]