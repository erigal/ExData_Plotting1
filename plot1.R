#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip ("data.zip")

#read data
hhpower <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
hhpowerFeb <- hhpower[(hhpower$Date=="1/2/2007" | hhpower$Date=="2/2/2007" ), ]

## Plot 1
with(hhpowerFeb,hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red"))

## export file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()