
bool_tool <- function(x){                              
	                                                                      
	x.num <- 0                            
                                          
	for(i in 1:NROW(x))                   
	if (x[i,1] > 0 &&                          
	    x[i,2] > 0)                             
                                          
	x.num <- x.num +1                     
                                          
	return(x.num/NROW(x))                                        
                                          
}                                         
                                              
                                          
x <- c(1,2,3,4,4,1,1,1,1,1,1,1)           
y <- c(1,2,3,4,4,1,1,-1,-1,-1,-1,-1)      
                                          
xy <- cbind(x,y)                          
                                          
class(xy)                                 
                                          
xy                                        
                                          
NROW(xy)                                  
                  
bool_tool(xy)                              
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          