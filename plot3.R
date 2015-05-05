setwd("~/data/R/coursera/Exploratory_Data/ass1")
elect <- read.table("~/data/R/coursera/Exploratory_Data/ass1/household_power_consumption.txt", header = TRUE, sep = ";")
library(dplyr)
welect <- filter(elect, Date=="1/2/2007" | Date=="2/2/2007")
welect$date <- paste(welect$Date, welect$Time)
welect$date <- strptime(welect$date, format="%d/%m/%Y %H:%M:%S")
welect$Global_active_power <- as.numeric(welect$Global_active_power)

png(filename = "plot3.png",
    width = 480, height = 480)
plot(welect$Sub_metering_1 ,type="l" , ylab="Energy sub metering",xlab="", xaxt = "n" )
lines(welect$Sub_metering_2 ,type="l", col="red" )
lines(welect$Sub_metering_3 ,type="l", col="blue" )
axis(1, at=c(0,1440, 2881), labels=c("Thu", "Fri", "Sat"))
legend("topright",lty=1, col=c("black","blue", "red"), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

