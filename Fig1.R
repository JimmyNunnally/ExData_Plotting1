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

##  Plot 1
png(file="plot1.png")
hist( B$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
