setwd("~/data/R/coursera/Exploratory_Data/ass1_copia")
elect <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?", comment.char = "", nrows=2075259)

library(dplyr)
elect$Date <- as.Date(elect$Date, format="%d/%m/%Y")
welect <- filter(elect, Date=="2007-02-01" | Date=="2007-02-02")
welect$date <- strptime( paste(welect$Date, welect$Time), format="%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
        plot(welect$date, welect$Sub_metering_1 ,type="l" , ylab="Energy sub metering",xlab="")
        lines(welect$date, welect$Sub_metering_2 ,type="l", col="red" )
        lines(welect$date, welect$Sub_metering_3 ,type="l", col="blue" )
        legend("topright",lty=1, col=c("black","blue", "red"), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


