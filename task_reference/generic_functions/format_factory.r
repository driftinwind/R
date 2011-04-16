formatter <- function (x){
	
	x <- head(tail(x, n=2), n=1)
	x <- x[,4]
	return(x)
}