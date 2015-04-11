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

#Building Plot3: 
png(filename = "Plot3.png", width = 480, height = 480, units = "px")
plot(fdata3$New_date, fdata3$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = 'l', col = "black")
lines(fdata3$New_date, fdata3$Sub_metering_2, type = 'l', col = "red")
lines(fdata3$New_date, fdata3$Sub_metering_3, type = 'l', col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
dev.off()