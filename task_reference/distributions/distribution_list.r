# Beta                beta 	
# Lognormal 	        lnorm
# Binomial 	        binom 
# Negative Binomial 	nbinom
# Cauchy 	            cauchy  
# Normal 	            norm
# Chisquare           chisq
# Poisson 	        pois
# Exponential         exp     
# Student t 	        t
# F 	                f 	            
# Uniform 	        unif
# Gamma 	            gamma            
# Tukey 	            tukey          
# Geometric 	        geom 
# Weibull 	        weib
# Hypergeometric 	    hyper 	
# Wilcoxon 	        wilcox   
# Logistic 	        logis   
require(zoo)
require(distr)

d1   <- rnorm(100)
d2   <- rnorm(100)

# data <- beta(d1, d2)
# data <- na.locf(data)

data <- lnorm(d1, d2)
data <- na.locf(data)

# data <- binom(d1, d2)
# data <- na.locf(data)

# data <- pois(d1, d2)
# data <- na.locf(data)




dens <- density(data)
plot(dens)
