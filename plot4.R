# Loading the data
data <- read.table('household_power_consumption.txt', header = T, sep = ";", na.strings = "?")

# Converting Date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Suvbsetting the data
dataSubset <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting Dates and Times
dataSubset$datetime <- strptime(paste(dataSubset$Date, dataSubset$Time), "%Y-%m-%d %H:%M:%S")

# Plot 4
dataSubset$datetime <- as.POSIXct(dataSubset$datetime)
par(mfrow = c(2, 2))
attach(dataSubset)
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
     xlab = "")
plot(Voltage ~ datetime, type = "l")
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(Global_reactive_power ~ datetime, type = "l")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
detach(dataSubset)
