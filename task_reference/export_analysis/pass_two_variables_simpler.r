numbers <- matrix(c(1:10), nrow = 5, ncol=2)

numbers

add <- function(x,y){
	sum <- x + y
	return(sum)
}

cheet_sheet <- cbind( numbers, mapply( add, numbers[,1], numbers[,2]))

cheet_sheet