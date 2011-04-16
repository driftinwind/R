require(gtools)

d5 <- c("CVX", "IBM", "JNJ", "MCD", "MMM")

D5 <- combinations(5,2,d5)
 
D5

dividend <- function(x,y) {

	cat("the pair is ", c(x,y))
	
}

# export the results to a file in order of most mean-reverting

cbind(D5,sapply(D5,dividend))
