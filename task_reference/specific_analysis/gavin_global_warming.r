URL <- url("http://www.cru.uea.ac.uk/cru/data/temperature/hadcrut3vgl.txt")
gtemp <- read.table(URL, fill = TRUE)

## Don't need the even rows --- perhaps do as case weights?
gtemp <- gtemp[-seq(2, nrow(gtemp), by = 2), ]
## set the Year as rownames
rownames(gtemp) <- gtemp[,1]
## Add colnames
colnames(gtemp) <- c("Year", month.abb, "Annual")
## Data for 2011 incomplete so work only with 1850-2010 data series
gtemp <- gtemp[-nrow(gtemp), ]


ylab <- expression(Temperature~Anomaly~(1961-1990)~degree*C)
plot(Annual ~ Year, data = gtemp, type = "o", ylab = ylab,
     main = "Global mean temperature anomaly 1850-2010")


grecent <- subset(gtemp, subset = Year >= 1995,                      
                  select = c(Year, Annual))                          
## plot                                                              
plot(Annual ~ Year, data = grecent, type = "o", ylab = ylab,         
     main = "Global mean temperature anomaly 1995-2010")             


## fit a linear model through these recent data                    
gm1 <- lm(Annual ~ Year, data = grecent)                           
gm0 <- lm(Annual ~ 1, data = grecent)                              
anova(gm0, gm1)                                                    
coef(gm1)                                                          



acf(resid(gm1), main = "Residuals of linear model")


layout(matrix(1:4, ncol = 2))
plot(gm1)
layout(1)


require(nlme)
gg0 <- gls(Annual ~ 1, data = grecent, method = "ML")
gg1 <- gls(Annual ~ Year, data = grecent, method = "ML")
gg2 <- gls(Annual ~ Year, data = grecent,
           correlation = corARMA(form = ~ Year, p = 1), method = "ML")
gg3 <- gls(Annual ~ Year, data = grecent,
           correlation = corARMA(form = ~ Year, p = 2), method = "ML")


R> anova(gg0, gg1, gg2, gg3)                                                            
    Model df       AIC       BIC   logLik   Test  L.Ratio p-value                       
gg0     1  2 -25.10920 -23.56403 14.55460                                               
gg1     2  3 -28.01874 -25.70097 17.00937 1 vs 2 4.909536  0.0267                       
gg2     3  4 -26.49875 -23.40839 17.24937 2 vs 3 0.480010  0.4884                       
gg3     4  5 -30.77369 -26.91075 20.38685 3 vs 4 6.274945  0.0122                       
                                                                                        



acf(resid(gg3, type = "normalized"))





R> summary(gg3)
Generalized least squares fit by maximum likelihood
  Model: Annual ~ Year
  Data: grecent
        AIC       BIC   logLik
  -30.77369 -26.91075 20.38685

Correlation Structure: ARMA(2,0)
 Formula: ~Year
 Parameter estimate(s):
      Phi1       Phi2
 0.2412298 -0.6527874 

Coefficients:
                 Value Std.Error   t-value p-value
(Intercept) -16.163962  6.232562 -2.593470  0.0212
Year          0.008268  0.003112  2.656464  0.0188

 Correlation:
     (Intr)
Year -1    

Standardized residuals:
        Min          Q1         Med          Q3         Max
-2.29284316 -0.68980863  0.03087847  0.51005562  1.99216289 

Residual standard error: 0.08715603
Degrees of freedom: 16 total; 14 residual


R> intervals(gg3)
Approximate 95% confidence intervals

 Coefficients:
                    lower          est.       upper
(Intercept) -29.531478957 -16.163962275 -2.79644559
Year          0.001592535   0.008267935  0.01494333
attr(,"label")
[1] "Coefficients:"

 Correlation structure:
          lower       est.       upper
Phi1 -0.1675377  0.2412298  0.38958957
Phi2 -0.9036540 -0.6527874 -0.06838202
attr(,"label")
[1] "Correlation structure:"

 Residual standard error:
     lower       est.      upper
0.05109686 0.08715603 0.14866224

R> pred <- data.frame(Year = 1995:2010)
R> pred <- transform(pred, yhat = predict(gg3, newdata = pred))
R> with(pred, yhat)
 [1] 0.3305672 0.3388351 0.3471030 0.3553710 0.3636389 0.3719069 0.3801748
 [8] 0.3884427 0.3967107 0.4049786 0.4132465 0.4215145 0.4297824 0.4380503
[15] 0.4463183 0.4545862
attr(,"label")
[1] "Predicted values"



layout(matrix(1:2, ncol = 2))
## plot full data
plot(Annual ~ Year, data = gtemp, type = "o", ylab = ylab,
     main = "Global mean temperature anomaly 1850-2010")
lines(yhat ~ Year, data = pred, lwd = 2, col = "red")
## plot the 1995-2010 close-up
plot(Annual ~ Year, data = grecent, type = "o", ylab = ylab,
     main = "Global mean temperature anomaly 1995-2010")
lines(yhat ~ Year, data = pred, lwd = 2, col = "red")
layout(1)





