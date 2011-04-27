# Given a bug object of gold <- GLD.gnat

# Add log returns of prices as new vector

gold$log_self <- dailyReturn(Cl(gold), type="log")


# Add log returs of Perfect Profit

 gold$perfect     <- abs(gold[,2] - gold[,3])
 gold$log_perfect <- log((gold$perfect/gold[,4]) + 1)

# Days system traded

NROW(gold) 

# Plot equity curve

plot(gold$equity)

# Naive expected return

mean(exp(gold$log_ret)) 

# Plot histogram

hist(exp(gold$log_ret), col="darkgoldenrod")

# Percent time system was long

NROW(which(gold$signal>0))/NROW(gold) 

# Winning percent for long trades

NROW( gold$signal[gold$signal == 1] & gold$log_ret[gold$log_ret > 0])/NROW(gold$signal[gold$signal == 1])