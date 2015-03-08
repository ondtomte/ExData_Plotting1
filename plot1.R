##Plot 1
library(dplyr)
##Read in the full data
power<-read.csv(file = "household_power_consumption.txt"
                ,sep = ";",header = TRUE,na.strings="?")
##Convert to df table
power<-tbl_df(power)
##Filter out disierd dates
power<-(power %>% filter(Date=="1/2/2007" | Date=="2/2/2007")
##Set output to png file
png(filename="./plot1.png",width = 480,height = 480)
##Create the plot
with(power,hist(Global_active_power,col="red",main="Global Active Power"
               ,xlab="Global Acitive Power (kilowatts)"))
##stop working with png file
dev.off()