# > tail(SampleData)
#              FAST       UP     DOWN
# 2010-12-09 27.778 27.13322 25.63011
# 2010-12-10 27.963 27.24453 25.82214
# 2010-12-13 28.195 27.39595 25.98405
# 2010-12-14 28.332 27.53465 26.16135
# 2010-12-15 28.359 27.62555 26.32178
# 2010-12-16 28.394 27.71714 26.49886
# > class(SampleData)
# [1] "data.frame"
# >





white_bumblebee <- function(x){
	
    x$POS <- sapply(x, nested_ifelse_below, )


	ifelse (x[,1] > x[,2], pos="long", 
	    ifelse(x[,1] < x[,3], pos="short", 
	        ifelse(x[,1] < x[,2] && x[,1] > [x.3], pos = pos[-1])))
  
   x$Position <- sapply( as.numeric(sign(x[,4]-x[,7])+2),
                         function(j) (j,"Short","Flat","Long"))
	               
   return(x)
}