setwd("~/data/R/coursera/Exploratory_Data/ass1")
elect <- read.table("~/data/R/coursera/Exploratory_Data/ass1/household_power_consumption.txt", header = TRUE, sep = ";")
library(dplyr)
welect <- filter(elect, Date=="1/2/2007" | Date=="2/2/2007")
welect$date <- paste(welect$Date, welect$Time)
welect$date <- strptime(welect$date, format="%d/%m/%Y %H:%M:%S")
welect$Global_active_power <- as.numeric(welect$Global_active_power)

png(filename = "plot2.png",
    width = 480, height = 480)
plot(welect$Global_active_power,type="l" , ylab="Global Active Powe(Kilowatts)",xlab="", xaxt = "n",)
axis(1, at=c(0,1440, 2881), labels=c("Thu", "Fri", "Sat"))
dev.off()