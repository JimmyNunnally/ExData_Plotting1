#load library
library(dplyr)

#Download and unzip  -Note: you will need to set up a working directory if you  havent already done so 
file <- "dataset4.zip"
site <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(site, file,method="curl")
unzip(file) 


A <- read.table('household_power_consumption.txt', header=T, sep=";", na.strings="?")

## set time variable
B <- A[A$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste( B$Date,  B$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
B <- cbind(SetTime,  B)

## Plot 4
png(file="plot4.png")
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot( B$SetTime,  B$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot( B$SetTime,  B$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot( B$SetTime,  B$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines( B$SetTime,  B$Sub_metering_2, type="l", col="red")
lines( B$SetTime,  B$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot( B$SetTime,  B$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
dev.off()
