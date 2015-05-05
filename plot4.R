setwd("~/data/R/coursera/Exploratory_Data/ass1")
elect <- read.table("~/data/R/coursera/Exploratory_Data/ass1/household_power_consumption.txt", header = TRUE, sep = ";")
library(dplyr)
welect <- filter(elect, Date=="1/2/2007" | Date=="2/2/2007")
welect$date <- paste(welect$Date, welect$Time)
welect$date <- strptime(welect$date, format="%d/%m/%Y %H:%M:%S")
welect$Global_active_power <- as.numeric(welect$Global_active_power)

png(filename = "plot4.png",
    width = 480, height = 480)

par(mfrow=c(2,2))
# plot1
plot(welect$Global_active_power,type="l" , ylab="Global Active Powe",xlab="", xaxt = "n",)
axis(1, at=c(0,1440, 2881), labels=c("Thu", "Fri", "Sat"))
#plot2
plot(welect$Voltage,type="l" , ylab="Voltage",xlab="datetime", xaxt = "n",)
axis(1, at=c(0,1440, 2881), labels=c("Thu", "Fri", "Sat"))
#plot3
plot(welect$Sub_metering_1 ,type="l" , ylab="Energy sub metering",xlab="", xaxt = "n" )
lines(welect$Sub_metering_2 ,type="l", col="red" )
lines(welect$Sub_metering_3 ,type="l", col="blue" )
axis(1, at=c(0,1440, 2881), labels=c("Thu", "Fri", "Sat"))
legend("topright",lty=1, col=c("black","blue", "red"), bty = "n", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot4
plot(welect$Global_reactive_power,type="l" , ylab="Global_reactive_power",xlab="datetime", xaxt = "n",)
axis(1, at=c(0,1440, 2881), labels=c("Thu", "Fri", "Sat"))

dev.off()
