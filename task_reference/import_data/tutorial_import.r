require (ts)

Thurman <- read.table("~/RMilk/task_reference/test_data/eggs1.txt", header=T)

year    <- ts(Thurman$year)
chic    <- ts(Thurman$chic)
egg     <- ts(Thurman$egg)