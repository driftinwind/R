grouper <- function(x)

{
		if ( x >= 0.01 )
         return (1)
    else if (x >= 0 && x < 0.01)
         return (2)	
    else if (x < 0 && x > -0.01)
         return (3)
    else
         return (4)          
}