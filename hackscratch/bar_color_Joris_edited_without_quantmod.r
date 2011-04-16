bar_color <- function(x){
  
   x$BarColor <- sapply( as.numeric(sign(x[,1]-x[,2])+2),
                         function(j) switch(j,"Green","Doji","Red"))
	                
    x$BarMood <- sapply( as.numeric(sign(x[,1]-x[,2])+2),                                     
                             function(j) switch(j,"Hot","Lukewarm","Cold"))                                                                                 

   return(x)
}
