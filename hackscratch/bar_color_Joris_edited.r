bar_color <- function(ticker){
   x <- as.data.frame(getSymbols(ticker,auto.assign=FALSE))

   x$BarColor <- sapply(
            as.numeric(sign(x[,1]-x[,4])+2),
            function(j) switch(j,"Green","Doji","Red")
   )

   return(x)
}
