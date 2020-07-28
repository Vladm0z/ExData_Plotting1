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

png(filename="Plot4.png", width=480, height=480, pointsize=10, type="cairo-png")
par(mfrow=c(2,2))
plot(data$datetime, data$Global_active_power, type ="l", xlab="", ylab="Global Active Power (kilowatts)") ##Plot2.png
plot(data$datetime, data$Voltage, type="l", xlab="datetime", ylab= "Voltage")
plot(data$datetime, data$Sub_metering_1, type ="l", xlab="", ylab="Energy sub metering") ##Plot3.png
lines(data$datetime, data$Sub_metering_2, col="red") ##sub_metering_2 in Plot3.png
lines(data$datetime, data$Sub_metering_3, col="blue") ##sub_metering_3 in Plot3.png
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, bty="n", col=c("black", "red", "blue"))
plot(data$datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()