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

#Create/save plot 3
png(file="plot3.png")
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot( B$SetTime,  B$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines( B$SetTime,  B$Sub_metering_2, col=columnlines[2])
lines( B$SetTime,  B$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
dev.off()
