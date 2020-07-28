##downloading & unzipping data
setwd("D:/Coursera/Exploratory data analysis/project 1")
FileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(FileUrl, destfile="household_power_consumption.zip", mode="wb")
unzip("household_power_consumption.zip", "household_power_consumption.txt")


##Plot
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?", colClasses =c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) 
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ] ##incude only feb 1&2, 2007
data$datetime <- paste(data$Date, data$Time) 
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S", tz="UTC")

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file="Plot1.png") ##histogram to png
dev.off()
