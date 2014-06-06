data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)


data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

datasub <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")
hist(datasub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()