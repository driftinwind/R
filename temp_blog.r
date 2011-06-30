I need to get my mind off the fact that I'm short the euro/dollar at present, and that China is hell-bent on driving the pair to infinity so they can sell their stuff to the Europeans for the next billion years. I'm a trapped euro bear, and my head is getting a little foggy. Before I exit this trade for an egregious loss, I need to think clearly. And there is no better tonic for clear thinking than trying to write a useful function in R.

I've decided to "quote" -- functionalize -- some repetitive stuff I do, and to get the math right once. For what I'm doing, there are logarithms that need to get added and then exponentiated with the number 1 subtracted. You put a parenthesis in the wrong place and everything becomes a mess quickly. And you may not even know it.

The following function returns a new object to your global environment that includes information about where the returns will be in the next few days. It's a building block function whose utility is limited by itself, but if you use your imagination it may come in handy.

future <- function(sym="GLD"){
	
	require("quantmod")
	
	x          <- getSymbols(sym, auto.assign=FALSE)                   
	x$ret      <- dailyReturn(x, type="log")                           
	x$ago.1    <- lag(x$ret, k=1)           
	x$ago.2    <- lag(x$ret, k=2)           
	x$ago.3    <- lag(x$ret, k=3)           
	x$ago.4    <- lag(x$ret, k=4)           
	x$next.1   <- lag(x$ret, k=-1)            
	x$next.2   <- lag(x$ret, k=-2)            
	x$next.3   <- lag(x$ret, k=-3)            
	x$next.4   <- lag(x$ret, k=-4)      
	
  #    get returns tomorrow, 2-days and 3-days into the future
  
	x$in.1     <-    exp(x$next.1)-1
  x$in.2     <-    exp(x$next.1 + x$next.2)-1
  x$in.3     <-    exp(x$next.1 + x$next.2 + x$next.3)-1
  x$in.4     <-    exp(x$next.1 + x$next.2 + x$next.3 + x$next.4)-1                 

  food       <- paste(sym,"future.returns",   sep=".")    
    
  assign(food, x, envir=.GlobalEnv)
}
