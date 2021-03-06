##Plot 2 of Course Project 1 for Exploratory Data Analysis, completed by Glenn Dunmire on 6/7/2014
##This script assumes the person running it has navigated to their working directory and placed a folder
##called "exdata_data_household_power_consumption in their working directory, obtained from the UCI Machine
##Learning database: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##This file is then unzipped, but no other modifications are made. 

##This plots a line showing the Global Active Power measured over the two days

#read data, assuming you have manually downloaded and unzipped the data, and placed in working directory. 
#data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                   #header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

##download data and load into variables. This assumes you have not downloaded and manually unzipped the data
##already. This will then place the plot1 in the working directory. 
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp) #requires 19.7 MB
data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?",
                   stringsAsFactors = FALSE) #requires 126 MB

#coerce data$Date column from character to a Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset dataset for relevant dates
datasub <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#Using paste, create a character vector combining the Date and Time columns. Then pass to the strptime() function
#using appropriate format to result in POSIXlt and POSIXt class objects. Store as a new column called datetime
datasub$datetime <- strptime(paste(datasub$Date, datasub$Time), format = "%Y-%m-%d %H:%M:%S")

##produce appropriate png file in working directory
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
plot(x = datasub$datetime, y = datasub$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", main = "", type = "l")
dev.off()