# take an existing xts object and output all manner of values


ret <- function(x)
    {
      # if(x != class(xts))
      #        cat("need an xts there buddy")
      #       
       x$ret   <- dailyReturn(Cl(x))
       x$ans   <- lag(x$ret, k=-1)
       x$rng   <- ran(Hi(x),Lo(x))
       x$rng.1 <- lag(x$rng, k=1)
       x$rng.2 <- lag(x$rng, k=2)
       x$rng.3 <- lag(x$rng, k=3)
       x$rng.4 <- lag(x$rng, k=4)
       x$rng.5 <- lag(x$rng, k=5)
       x$rng.6 <- lag(x$rng, k=6)
       x$rng.7 <- lag(x$rng, k=7)
       # x$ANS[x$ret >  0]  <- 1  
       #        x$ANS[x$ret =< 0]  <- 0
 
       return(x)
     }
     
     
       per <- function(x,y){
         n <- (y-x)/x
         return(n)
       }
       
       ran <- function(x,y){
         n <- x-y
         return(n)
       }
       
       ret <- function(x)
       {
          x$ret   <- dailyReturn(Cl(x))
          x$ans   <- lag(x$ret, k=-1)
          x$rng   <- ran(Hi(x),Lo(x))
          x$rng.1 <- lag(x$rng, k=1)
          x$rng.2 <- lag(x$rng, k=2)
          x$rng.3 <- lag(x$rng, k=3)
          x$rng.4 <- lag(x$rng, k=4)
          x$rng.5 <- lag(x$rng, k=5)
          x$rng.6 <- lag(x$rng, k=6)
          x$rng.7 <- lag(x$rng, k=7)

          return(x)
        }

       rng <- function(x,y){              
          n <- (x-y)/y                    
          return(n)                       
        }                                 
     