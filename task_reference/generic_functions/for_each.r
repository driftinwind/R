dow_list <- c("AA","AXP")#,"BA","BAC","CAT","CSCO",
              # "CVX","DD","DIS","GE","HD","HPQ",
              #               "IBM","INTC","JNJ","JPM","KFT",
              #               "KO","MCD","MMM","MRK","MSFT","PFE",
              #               "PG","T","TRV","UTX","VZ","WMT","XOM")
              
require("quantmod")

getSymbols(c(dow_list), from = "2011-03-01")


# get(dow_list[1])[,4]

# AA <- AA[,4]
# AA <- head(tail(AA, n=2), n=1)

# 
# for( i in dow_list){
# 	
# 	get(dow_list[i]) <- head(tail(get(dow_list[i]), n=2), n=1)
# 	
# } 
# 
# AA


# function ()
# 
#    {
# 	
# 	print(dow_list[i])	
#  	# dow_list[i] <- head(tail(dow_list[i], n=2), n=1)
#  	#  	dow_list[i] <- dow_list[i][,4]
#  	#  	return(dow_list[i])
#     }
#   
# 
