leader <- function(cor, ave, ret)

{
		if ( cor > ave && ret < 0 || cor < ave && ret > 0 )
         return (1)
     else
         return (0)	
}