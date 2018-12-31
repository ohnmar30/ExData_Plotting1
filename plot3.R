# reading data
data <- read.table("household_power_consumption.txt", , header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")

# convert into the date class (Date column of data )
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# filtering data for a specific date
#data <- data[Date >= "2007-02-01" & Date <= "2007-02-02"]
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]



# convert into time class (datetime column of data)
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# plot 3

data$datetime <- as.POSIXct(data$datetime)

plot(data$Sub_metering_1 ~ data$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
