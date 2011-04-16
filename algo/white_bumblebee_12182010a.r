# This time we will return the POS vector as a number


white_bumblebee <- function(x){
	
	POS <- ifelse (x[,4] > x[,8], 1, 
	         ifelse(x[,4] < x[,6], -1, 
	           0))
  
   return(POS)
}

