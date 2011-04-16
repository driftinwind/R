nested_ifelse <- function(x){

	ifelse (x[,1] > x[,2], POSITION <- "long",
	    ifelse(x[,1] < x[,3], POSITION <- "short", 
	        ifelse(x[,1] < x[,2] && x[,1] > x[,3], POSITION <- "same as yesterday" )))
          
   return(POSITION)
}