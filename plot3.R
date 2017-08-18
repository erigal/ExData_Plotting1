#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip ("data.zip")

#read data
hhpower <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
hhpowerFeb <- hhpower[(hhpower$Date=="1/2/2007" | hhpower$Date=="2/2/2007" ), ]
hhpowerFeb$DateTime <- strptime(paste(hhpowerFeb$Date,hhpowerFeb$Time),"%d/%m/%Y %H:%M:%S")

## Plot 3
with(hhpowerFeb,plot(DateTime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(hhpowerFeb,lines(DateTime,Sub_metering_2,col="Red"))
with(hhpowerFeb,lines(DateTime,Sub_metering_3,col="Blue"))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## export file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()