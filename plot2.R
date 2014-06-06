data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
 data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datasub <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

datasub$datetime <- strptime(paste(datasub$Date, datasub$Time), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
plot(x = datasub$datetime, y = datasub$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", main = "", type = "l")
dev.off()