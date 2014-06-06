##Plot 3 of Course Project 1 for Exploratory Data Analysis, completed by Glenn Dunmire on 6/7/2014
##This script assumes the person running it has navigated to their working directory and placed a folder
##called "exdata_data_household_power_consumption in their working directory, obtained from the UCI Machine
##Learning database: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##This file is then unzipped, but no other modifications are made. 

##This plots the three Sub_metering variables as lines to compare their values. 

#read data
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#Coerce characters in Date to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset relevant dates
datasub <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#Using paste, create a character vector combining the Date and Time columns. Then pass to the strptime() function
#using appropriate format to result in POSIXlt and POSIXt class objects. Store as a new column called datetime
datasub$datetime <- strptime(paste(datasub$Date, datasub$Time), format = "%Y-%m-%d %H:%M:%S")

#produce png as plot3.png in working directory
png(filename = "plot3.png", width = 480, height = 480, bg = "transparent")
#plots initial Sub_metering_1
plot(x = datasub$datetime, y = datasub$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")

#add Sub_metering_2
lines(x = datasub$datetime, y = datasub$Sub_metering_2, col = "red")
#add Sub_metering_3
lines(x = datasub$datetime, y = datasub$Sub_metering_3, col = "blue")

#add a legend to identify which color line is which
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1, 1, 1))
dev.off()