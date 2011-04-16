
extractor <- function(x, pct=.1){
	
   tails <- matrix(c(0,0))  
                 
   for(i in 1:NROW(x))                          	
   if (x[i] > pct)                            
   tails[1] <- tails[1] + 1                        
			            
   for(i in 1:NROW(x))             		      
   if (x[i] < -pct)    			           
   tails[2] <- tails[2] + 1                
    
   return(tails)                    
}                       
   