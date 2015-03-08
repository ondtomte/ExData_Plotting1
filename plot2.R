##Plot 2
library(dplyr)
library(lubridate)
##Read in the full data
power<-read.csv(file = "household_power_consumption.txt"
                ,sep = ";",header = TRUE,na.strings="?")
##Convert to df table
power<-tbl_df(power)
##Filter out disierd dates
power<-(power %>% filter(Date=="1/2/2007" | Date=="2/2/2007")
        %>% mutate(datetime=dmy_hms(paste(Date,Time))))
##Set output to png file
png(filename="./plot2.png",width = 480,height = 480)
##Create the plot
with(power,plot(datetime,Global_active_power,type = "l"
                 ,ylab = "Global Active Power (killowatts)",xlab="",col="black",main=""))
##stop working with png file
dev.off()