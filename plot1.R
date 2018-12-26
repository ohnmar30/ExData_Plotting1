# reading data
data <- read.table("household_power_consumption.txt", , header=TRUE, sep=";", stringsAsFactors=FALSE, , na.strings = "?")

# convert into the date class (Date column of data )
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# filtering data for a specific date
#data <- data[Date >= "2007-02-01" & Date <= "2007-02-02"]
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]



# convert into time class (datetime column of data)
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#plot 1
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

# saving into png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
