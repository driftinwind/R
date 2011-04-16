#load data example
myData <- read.csv('~/Dropbox/DATA/NASS/Corn.csv')
head(myData)
require(Hmisc)
describe(myData)

IAdata <- subset(myData, State=='Iowa')
head(IAdata)
plot(IAdata$Year, IAdata$Yield)

#linear regression example
#IAtrend <- lm(Yield ~ Year, data=IAdata)
#summary(IAtrend)
#predict(IAtrend)
#lines(IAdata$Year, predict(IAtrend))

#IAdata$trendYield <- predict(IAtrend)
#describe(IAdata)


#linear Regreassion across groups
#source http://stackoverflow.com/questions/1297698/plotting-regression-results-from-lme4-in-r-using-lattice-or-something-else
#library(plyr)
#allTrends <- dlply(myData, "State", function(df) lm(Yield ~ Year, data=df))
#allTrends
#allPredicted <- ldply(allTrends, as.data.frame(predict))
#allPredicted
#allActual <- ldply(allTrends, function(x) as.data.frame(x["model"]))
#head(allActual)
#finalOutput <- cbind(allActual, allPredicted$value)
#head(finalOutput)

#names(finalOutput) <- c("State", "Yield", "Year", "Predicted")
#head(finalOutput)

#plot with ggplot
#source http://stackoverflow.com/questions/1313954/plotting-two-vectors-of-data-on-a-ggplot2-scatter-plot-using-r
#library(ggplot2)
#longData <- melt(finalOutput, measure.vars = c("Yield", "Predicted"))
#head(longData, 50)

#qplot(Year, value, a
 #     data = longData, 
  #    colour=variable) + facet_wrap(~State)
