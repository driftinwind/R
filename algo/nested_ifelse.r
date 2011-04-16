nested_ifelse <- function(x){

	ifelse (x > 4, x <- "long",
	    ifelse(x < 1, x <- "short", 
	        ifelse(x < 4 && x > 1, x <- "same as yesterday" )))
          
   return(x)
}