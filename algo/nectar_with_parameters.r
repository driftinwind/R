
nectar <- function(ticker="GLD", fast=10, slow=30, width=0.5, tailsize=12) {
	
	require("quantmod")
	x <-getSymbols(ticker, auto.assign=FALSE)
	fastBB <- BBands(( x[,4] ), n=fast, sd=width)
	slowBB <- BBands(( x[,4] ), n=slow, sd=width)
	my_data <- merge(x, fastBB, slowBB)
	my_data <- as.data.frame(my_data)
	
	white_bumblebee <- function(my_data){

    Position <- ifelse (my_data[,8] > my_data[,13], "long", 
		          ifelse(my_data[,8] < my_data[,11], "short", 
		            "same as yesterday"))  
	return(Position)
	}
	
	my_data$Position <- white_bumblebee(my_data)
	my_data <- my_data[,c(4,15)]
	tail(my_data, n=tailsize)
}