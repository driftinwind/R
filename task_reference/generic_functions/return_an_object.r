escape <- function(x){
	
	x_squared  <<- x^2
    
    assign("x_times_x", x*x, envir = .GlobalEnv)

}