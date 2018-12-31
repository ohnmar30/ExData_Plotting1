# reading data
data <- read.table("household_power_consumption.txt", , header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")

# convert into the date class (Date column of data )
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# filtering data for a specific date
#data <- data[Date >= "2007-02-01" & Date <= "2007-02-02"]
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# convert into time class (datetime column of data)
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#plot 2
plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# saving into plot2.png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()