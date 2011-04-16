# ORIGNAL CODE ######################
# set.seed(1)
# draws <- rnorm(100)^2
# dens <- density(draws)
# plot(dens)
# 
# 
# q75 <- quantile(draws, .75)
# q95 <- quantile(draws, .95)
# 
# x1 <- min(which(dens$x >= q75))  
# x2 <- max(which(dens$x <  q95))
# with(dens, polygon(x=c(x[c(x1,x1:x2,x2)]), y= c(0, y[x1:x2], 0), col="gray"))
###############################################################################

set.seed(1)
draws <- rnorm(100)^2
dens <- density(draws)

png("~/Desktop/JD.png")

plot(dens, main="Shade Two Tails")

q2   <- 2
q65   <- 6.5
qn08 <- -0.8
qn02   <- -0.2

x1 <- min(which(dens$x >= q2))  
x2 <- max(which(dens$x <  q65))
x3 <- min(which(dens$x >= qn08))  
x4 <- max(which(dens$x <  qn02))

with(dens, polygon(x=c(x[c(x1,x1:x2,x2)]), y= c(0, y[x1:x2], 0), col="gray"))
with(dens, polygon(x=c(x[c(x3,x3:x4,x4)]), y= c(0, y[x3:x4], 0), col="gray"))

dev.off()