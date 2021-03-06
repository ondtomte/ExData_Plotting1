##Plot 3
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
png(filename="./plot4.png",width = 480,height = 480)
##Create the plot
par(mfcol=c(2,2))
with(power, plot(datetime,Global_active_power,type="l", col="black",xlab="", 
                  ylab="Global Active Power (kilowatts)", main=""))


with(power,plot(datetime,Sub_metering_1,type = "l"
                ,ylab = "Energy sub metering"
                ,xlab="",col="black",main=""))
with(power,lines(datetime,Sub_metering_2,type="l",col="red"))
with(power,lines(datetime,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n")

with(power,plot(datetime,Voltage,type="l"))

with(power,plot(datetime,Global_reactive_power,type="l"))

##stop working with png file
dev.off()