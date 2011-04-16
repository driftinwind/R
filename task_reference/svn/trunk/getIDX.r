## this script will get data from IDXData 

########## call packages

require(quantmod)

################## output to file

# sink("~/Dropbox/DATA/YAHOO/learnSPX.csv", split=TRUE)

############## get data from Dropbox/DATA/IDXData

gold <- read.zoo("~/Dropbox/DATA/IDXDATA/$GOLD.CSV", sep=",", format ="%m/%d/%Y", header=TRUE)

Gold <- as.xts(gold, order.by=index(gold), frequency=NULL)


tail(gold)

#Gold <- as.xts(gold)

#tail (Gold)

#plot (gold)



## write.table(goldStudy,  "~/Dropbox/DATA/learnSPX.csv")



