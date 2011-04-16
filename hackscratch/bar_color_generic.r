bar.color <- function(x) {

    open <- x[,1]
    close <- x[,2]

    if       (open > close)    
             "Red"                                                                              
    else if  (open < close)                                                                                                                                                     
              "Green"
    else       
             "Doji"
	                                      
}



