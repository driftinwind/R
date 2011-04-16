# the sign() function is a little trick that works with three conditions, 
# but we really have four conditions that need to be evaluated, so I'm 
# gonna have to go a differenr way. Below is the switch version: 
# 
# white_bumblebee <- function(x){
#   
#    x$Position <- sapply( as.numeric(sign(x[,4]-x[,7])+2),
#                          function(j) switch(j,"Short","Flat","Long"))
# 	               
#    return(x)
# }

# And below is the ifelse(test, no, yes) nested solution

white_bumblebee <- function(x){
	
	ifelse (x[,4] > x[,8], pos="long", 
	    ifelse(x[,4] < x[,6], pos="short", 
	        ifelse(x[,4] < x[,8] && x[,4] > [x.6], pos = pos[-1])))
  
   x$Position <- sapply( as.numeric(sign(x[,4]-x[,7])+2),
                         function(j) ifelse(x[,j,"Short","Flat","Long"))
	               
   return(x)
}