##Plot 4 of Course Project 1 for Exploratory Data Analysis, completed by Glenn Dunmire on 6/7/2014
##This script assumes the person running it has navigated to their working directory and placed a folder
##called "exdata_data_household_power_consumption in their working directory, obtained from the UCI Machine
##Learning database: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##This file is then unzipped, but no other modifications are made. 

#Produces four plots showing the Global Active power, Voltage, Sub_metering, and Global Reactive Power over time


#read data, assuming you have manually downloaded and unzipped the data and placed in your working directory
#data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                   #header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

##download data and load into variables. This assumes you have not downloaded and manually unzipped the data
##already. This will then place the plot1 in the working directory. 
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp) #requires 19.7 MB
data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?",
                   stringsAsFactors = FALSE) #requires 126 MB

#Coerce characters in Date to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset relevant dates
datasub <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#Using paste, create a character vector combining the Date and Time columns. Then pass to the strptime() function
#using appropriate format to result in POSIXlt and POSIXt class objects. Store as a new column called datetime
datasub$datetime <- strptime(paste(datasub$Date, datasub$Time), format = "%Y-%m-%d %H:%M:%S")

#open the graphics device
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")

#set dimensions, will fill in row wise
par(mfrow = c(2,2))

#add first plot, Global Active Power over time
plot(x = datasub$datetime, y = datasub$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", main = "", type = "l")

#add second plot, Voltage over time
plot(x = datasub$datetime, y = datasub$Voltage, xlab = "datetime", 
       ylab = "Voltage", main = "", type = "l")

#add third plot, 3 sub_metering values over time
plot(x = datasub$datetime, y = datasub$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(x = datasub$datetime, y = datasub$Sub_metering_2, col = "red")
lines(x = datasub$datetime, y = datasub$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1, 1, 1))

#add fourth plot, Global Reactive Power over time
plot(x = datasub$datetime, y = datasub$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", main = "", type = "l")

dev.off()