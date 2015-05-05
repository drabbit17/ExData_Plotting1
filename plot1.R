setwd("~/data/R/coursera/Exploratory_Data/ass1")
elect <- read.table("~/data/R/coursera/Exploratory_Data/ass1/household_power_consumption.txt", header = TRUE, sep = ";")
library(dplyr)
welect <- filter(elect, Date=="1/2/2007" | Date=="2/2/2007")
welect$Date <- as.Date(welect$Date, format="%d/%m/%Y")
welect$Global_active_power <- as.numeric(welect$Global_active_power)

png(filename = "plot1.png",
    width = 480, height = 480)
hist(welect$Global_active_power, xlab="Global Active Powe(Kilowatts)", ylab="Frequency", col="red", main="Global Active Power")
dev.off()