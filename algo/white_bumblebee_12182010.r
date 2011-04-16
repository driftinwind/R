white_bumblebee <- function(x){
	
	POS <- ifelse (x[,4] > x[,8], "long", 
	         ifelse(x[,4] < x[,6], "short", 
	           "same as yesterday"))
  
   return(POS)
}

