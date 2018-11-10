# Loading the data
data <- read.table('household_power_consumption.txt', header = T, sep = ";", na.strings = "?")

# Converting Date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Suvbsetting the data
dataSubset <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting Dates and Times
dataSubset$datetime <- strptime(paste(dataSubset$Date, dataSubset$Time), "%Y-%m-%d %H:%M:%S")

# Plot 1
attach(dataSubset)
hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

# Saving the plot in a file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(dataSubset)