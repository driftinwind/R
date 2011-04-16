blueberry_guts <- function(sym="SLV", expiry=24, pct=.10, file="~/Desktop/n_days_ago.png"){
   
           

   for(i in 1:NROW(change))
   if(change[i] >= 0)
   tails[3] <- tails[3] + 1
                           
   for(i in 1:NROW(change))
   if(change[i] < 0)
   tails[4] <- tails[4] + 1        
   

   for(i in 1:NROW(change))
   if(change[i] < 0)
   tails[5] <- tails[5] + 1

   for(i in 1:NROW(change))
   if(change[i] < 0)
   tails[6] <- tails[6] + 1

   chng_win    <- tails[1]
   chng_lose   <- tails[2]
   chng_mean   <- mean(change)
   chng_median <- median(change)  

   tails
                                                   
   # dens   <- density(change)                       
   #                                                        
   #    png(file)                                                                                            
   #                                                                                                         
   #    plot(dens, main="% Change From Close Today & Close n-Days Ago")                                      
   #                                                                                                         
   #    lowest      <-  min(change)                                                                                 
   #    select_lo   <-  -pct                                                                                 
   #    highest     <-  max(change)                                                                                 
   #    select_hi   <-   pct                                                                                 
   #                                                                                                         
   #    x1 <- min(which(dens$x >= select_hi))                                                                
   #    x2 <- max(which(dens$x <  highest))                                                                  
   #    x3 <- min(which(dens$x >= lowest))                                                                   
   #    x4 <- max(which(dens$x <  select_lo))                                                                
   #                                                                                                         
   #    with(dens, polygon(x=c(x[c(x1,x1:x2,x2)]), y= c(0, y[x1:x2], 0), col="lightsteelblue"))              
   #    with(dens, polygon(x=c(x[c(x3,x3:x4,x4)]), y= c(0, y[x3:x4], 0), col="lightgoldenrod2"))  
   # 
   #    legend("topleft", paste(" Ticker                     ",sym,                        "\n",
   # 	                       "Trading Days         ",       NROW(change),                   "\n",
   #                            "Days Out                ",    expiry,                       "\n", 
   #                            "Excursion %           ",      pct*100,                        "\n", 
   #                            "Over Achievers       ",       chng_win,                       "\n", 
   #                            "Under Achievers     ",        chng_lose,                       "\n", 
   #                            "Mean:                      ", round(chng_mean,   digits=3),   "\n", 
   #                            "Median:                   ",  round(chng_median, digits=3),   "\n"),
   # 
   #                                  bty="n", bg="gray", cex = .7, xjust=0)           
   #                                                                                                         
   #    dev.off()                                                                                            
                                                       
}                                                   
