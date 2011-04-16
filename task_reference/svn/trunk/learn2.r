## this is the second version of organizing time series
## data for the purpose of feeding a network

########## call packages

require(quantmod)

################## output to file

# sink("~/Dropbox/DATA/YAHOO/learnSPX.csv", split=TRUE)

############## get data from Yahoo

getSymbols("^GSPC")

################ rename the file its variables

SPX <- GSPC		#still an xts object

names (SPX) <- c("O","H","L","C","V","A")  # manageable names

############# get rid of junk

SPX$V <- NULL
SPX$A <- NULL

tail (SPX)

############### add new variables while retaining xts objectness

SPX$T		<- (SPX$H+SPX$L+SPX$C)/3  #T stands for Typical Price
SPX$R	 	<- SPX$H-SPX$L            #R stands for Range
SPX$CT		<- SPX$T - SPX$C

tail (SPX)
SPX$Cper	<- ROC(SPX$C)
SPX$Tper	<- ROC(SPX$T)


tail (SPX)
############# answer variable

SPX$Answer	<- lag(SPX$R, k=-1) #tommorrow's range


tail (SPX)


write.table(SPX,  "~/Dropbox/DATA/learn2.csv")


