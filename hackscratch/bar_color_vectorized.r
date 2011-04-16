bar.color <- function(x) {

    open <- x[,1]
    close <- x[,2]

    ifelse      (open >= close, "Red", "Green")    
	                                      
}



