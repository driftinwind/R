bar_color <- function(ticker) {

    require("quantmod")

    x <- getSymbols(ticker)                                     
                                                                                   
    open        <- x[,1]                                                           
    close       <- x[,2]                                                           
                                                                                                              
    ifelse(open > close, "Red", "Green")                                           
}                                                                                  
     