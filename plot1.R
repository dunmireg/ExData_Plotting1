##Plot 1 of Course Project 1 for Exploratory Data Analysis, completed by Glenn Dunmire on 6/7/2014
##This script assumes the person running it has navigated to their working directory and placed a folder
##called "exdata_data_household_power_consumption in their working directory, obtained from the UCI Machine
##Learning database: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##This file is then unzipped, but no other modifications are made. 

##This plots a histogram showing the frequency of values for the Global Active Power measurements


##Read the data, note sep = ";" and na.strings = "?" and stringsAsFactors set to FALSE. 
##Note: please use this if you have already downloaded the data, manually unzipped, and 
##placed in your working directory. 
##data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
# header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

##download data and load into variables. This assumes you have not downloaded and manually unzipped the data
##already. This will then place the plot1 in the working directory. 
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp) #requires 19.7 MB
data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?",
                   stringsAsFactors = FALSE) #requires 126 MB



##Coerce the characters in the Date column to class Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##subset data to get relevant dates
datasub <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

##create a png file called plot1.png that displays a histogram of the Global Active Power for Feb 1 and 2 in 2007
##This plot will output in the working directory. 
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")
hist(datasub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()