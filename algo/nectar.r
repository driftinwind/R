
nectar <- function(ticker) {
	
	require("quantmod")
	
	x       <- getSymbols(ticker, auto.assign=FALSE)
	fastBB  <- BBands(( x[,4] ), n=10, sd=0.5)
	slowBB  <- BBands(( x[,4] ), n=30, sd=0.5)
	my_data <- merge(x, fastBB, slowBB)
	my_data <- as.data.frame(my_data)
	
	white_bumblebee <- function(my_data){

    Position <- ifelse (my_data[,8] > my_data[,13], "long",                                 
                  ifelse(my_data[,8] < my_data[,11], "short",                               
                    "same as yesterday"))                                                   
    return(Position)                                                                        
    }                                                                                       
                                                                                            
    my_data$Position <- white_bumblebee(my_data)                                            
    my_data          <- my_data[,c(4,15)]                                                
                                                                                         
    tail(my_data, n=12)                                                                     
}                                                                                           








