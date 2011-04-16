require("quantmod")

symbols <- c("AA","AXP")#,"BA","BAC","CAT","CSCO",
              # "CVX","DD","DIS","GE","HD","HPQ",
              # "IBM","INTC","JNJ","JPM","KFT",                         
              # "KO","MCD","MMM","MRK","MSFT","PFE",                    
              # "PG","T","TRV","UTX","VZ","WMT","XOM")                  

# dow <- new.env()


getSymbols(c(symbols), from = "2011-03-01")


for (i in 1:length(symbols)) 

	x  <- get(symbols[i])  # assign xts object to a variable

    x <- x[,4]

    x <- head(tail(x, n=2), n=1)
	
    x  # -> change the variable name to a unique value and push into environment


# > z="F"
# > z
# [1] "F"
# 
#    symbols[i] <- assign(get(symbols[i])[,4])
# 
#     print(AA)
    # print(head(tail(x), n=2), n=1)
    # 
    # print get(symbols[i])
    # 	
    # 	
    # print(a[2]) 




