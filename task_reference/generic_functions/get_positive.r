getPositive <- function(x){
	
	num <- 0  
	
	for(i in 1:NROW(x))
	 if (x[i] > 0)
	
	num <- num + 1
	return(num)	
	
} 