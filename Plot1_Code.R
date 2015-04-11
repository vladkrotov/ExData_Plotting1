#Loading and formatting data
library(lubridate)
library(dplyr)
mydata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
mydata$Date = dmy(mydata$Date)
mydata$Date = as.Date(mydata$Date)

mydata10 <- mutate(mydata, New_date = paste(mydata$Date, mydata$Time, sep = " "))
mydata10$New_date <- ymd_hms(mydata10$New_date)
fdata1 <- filter(mydata10, Date == "2007-02-01")
fdata2 <- filter(mydata10, Date == "2007-02-02")
data3 <- rbind(fdata1, fdata2)
fdata3 <- data3
fdata3$Global_active_power <- as.numeric(paste(fdata3$Global_active_power))
fdata3$Sub_metering_1 <- as.numeric(paste(fdata3$Sub_metering_1))
fdata3$Sub_metering_2 <- as.numeric(paste(fdata3$Sub_metering_2))
fdata3$Sub_metering_3 <- as.numeric(paste(fdata3$Sub_metering_3))
fdata3$Voltage <- as.numeric(paste(fdata3$Voltage))
fdata3$Global_active_power <- as.numeric(paste(fdata3$Global_active_power))

#Bulding Plot1: 
png(filename = "Plot1.png", width = 480, height = 480, units = "px")
hist(fdata3$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power",col = "red")
dev.off()

