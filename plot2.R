#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip ("data.zip")

#read data
hhpower <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
hhpowerFeb <- hhpower[(hhpower$Date=="1/2/2007" | hhpower$Date=="2/2/2007" ), ]
hhpowerFeb$DateTime <- strptime(paste(hhpowerFeb$Date,hhpowerFeb$Time),"%d/%m/%Y %H:%M:%S")

## Plot 2
with(hhpowerFeb,plot(DateTime,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

## export file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()