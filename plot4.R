#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip ("data.zip")

#read data
hhpower <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
hhpowerFeb <- hhpower[(hhpower$Date=="1/2/2007" | hhpower$Date=="2/2/2007" ), ]
hhpowerFeb$datetime <- strptime(paste(hhpowerFeb$Date,hhpowerFeb$Time),"%d/%m/%Y %H:%M:%S")

## Create graph canvas
par(mfcol=c(2,2))

## Plot 1
with(hhpowerFeb,plot(datetime,Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))

## Plot 4
with(hhpowerFeb,plot(datetime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(hhpowerFeb,lines(datetime,Sub_metering_2,col="Red"))
with(hhpowerFeb,lines(datetime,Sub_metering_3,col="Blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1, lwd=1, bty="n")

## Plot 3
with(hhpowerFeb,plot(datetime,Voltage, type = "l", ylab="Voltage"))

## Plot 4
with(hhpowerFeb,plot(datetime,Global_reactive_power, type = "l"))

## export file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()