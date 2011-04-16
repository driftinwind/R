## convert as effeciently as possible a csv into xts

require(quantmod)


gold <- as.xts(read.zoo("~/Dropbox/DATA/IDXDATA/$GOLD.CSV", sep=",", format ="%m/%d/%Y", header=TRUE))
silver <- as.xts(read.zoo("~/Dropbox/DATA/IDXDATA/$SILVER.CSV", sep=",", format ="%m/%d/%Y", header=TRUE))


str(gold)
str(silver)

head (gold)
head (silver)


GoldSilver <- gold/silver



