# ds <- seq(1020,1400, 20)
# dp <- seq(.01, .99, .05)
# 
# 
# dens <- density(ds)
# plot(dens)

# plot(function(x) qnorm(x, log.p=TRUE), -50, 10,


     # main = "log { Normal Cumulative }")

den <- rnorm(100, m=50, sd=10)

dens <- density(den)

plot(dens)

gdens <- gamma(den)

ggdens <- density(gdens)

plot(gdens)
