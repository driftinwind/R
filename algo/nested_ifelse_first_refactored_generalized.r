nested_ifelse <- function(x){

	ifelse (x > 1,     mood <- "happy",
	    ifelse(x < 0,  mood <- "sad", 
	                   mood <- "same as yesterday" ))
          
   return(mood)
}