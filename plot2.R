setwd("~/data/R/coursera/Exploratory_Data/ass1_copia")
elect <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?", comment.char = "", nrows=2075259)

library(dplyr)

elect$Date <- as.Date(elect$Date, format = "%d/%m/%Y")
welect <- filter(elect, Date == "2007-02-01" | Date == "2007-02-02")
welect$date <- strptime(paste(welect$Date, welect$Time), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot1.png", width = 480, height = 480)
        plot(welect$date, welect$Global_active_power, type = "l", ylab = "Global Active Powe(Kilowatts)", xlab = "")
dev.off()
