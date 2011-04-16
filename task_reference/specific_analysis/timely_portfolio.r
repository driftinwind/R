require(quantmod)
require(TTR)
require(PerformanceAnalytics)

tckr<-c("GLD","SLV","IWM")

start<-"2006-06-30"
end<- format(Sys.Date(),"%Y-%m-%d") # yyyy-mm-dd

# Pull tckr index data from Yahoo! Finance
getSymbols(tckr, from=start, to=end)

#adjust for splits and dividends
GLD<-adjustOHLC(GLD,use.Adjusted=T)
SLV<-adjustOHLC(SLV,use.Adjusted=T)
IWM<-adjustOHLC(IWM,use.Adjusted=T)

#get daily return from prices to use PerformanceAnalytics
GLD<-dailyReturn(GLD)
SLV<-dailyReturn(SLV)
IWM<-dailyReturn(IWM)

RetToAnalyze<-merge(GLD,SLV,IWM)
colnames(RetToAnalyze)<-tckr

charts.RollingRegression(last(RetToAnalyze,"3 years")[,c(1,2),drop=F],last(RetToAnalyze,"5 years")[,3],legend.loc="topleft",width=20,main="Rolling 20-day Regression")
chart.RollingPerformance(RetToAnalyze,width=150,legend.loc="topleft",main="Rolling 150-day Performance")