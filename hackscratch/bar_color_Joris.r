bar_color <- function(ticker){
   x <- as.data.frame(getSymbols(ticker,auto.assign=FALSE))

   x$barcolor <- sapply(
            as.numeric(sign(x[,1]-x[,4])+2),
            function(j) switch(j,"Green Bar","Doji Bar","Red Bar")
   )

   return(x)
}
