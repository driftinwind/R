## this script will get data from Yahoo
## add and delete columns
## send massaged file to a directory

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

tail (SPX)
SPX$CC1 	<- diff(SPX$C, lag=1)
SPX$TT1		<- diff(SPX$T, lag=1)

SPX$CC2 	<- diff(SPX$C, lag=2)
SPX$TT2		<- diff(SPX$T, lag=2)

SPX$CC3 	<- diff(SPX$C, lag=3)
SPX$CC3 	<- diff(SPX$C, lag=3)

SPX$CC4 	<- diff(SPX$C, lag=4)
SPX$CC4 	<- diff(SPX$C, lag=4)

SPX$CC5 	<- diff(SPX$C, lag=5)
SPX$CC5 	<- diff(SPX$C, lag=5)

SPX$TT7		<- diff(SPX$T, lag=7)
SPX$TT7		<- diff(SPX$T, lag=7)

SPX$TT10       	<- diff(SPX$T, lag=10)
SPX$TT10       	<- diff(SPX$T, lag=10)

SPX$TT13       	<- diff(SPX$T, lag=13)
SPX$TT13       	<- diff(SPX$T, lag=13)

SPX$CC20 	<- diff(SPX$C, lag=20)
SPX$TT20       	<- diff(SPX$T, lag=20)

SPX$CC50 	<- diff(SPX$C, lag=50)
SPX$TT50       	<- diff(SPX$T, lag=50)

tail (SPX)
SPX$Cper1	<- ROC(SPX$C)
SPX$Tper1	<- ROC(SPX$T)


tail (SPX)
############# answer variable

SPX$Answer	<- lag(SPX$R, k=-1) #tommorrow's range


tail (SPX)


write.table(SPX,  "~/Dropbox/DATA/learnSPX.csv")


