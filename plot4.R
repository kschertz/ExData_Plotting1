class <- c("character", "character", rep("numeric",7))
power <- read.table("household_power_consumption.txt", colClasses=class, header=TRUE, sep = ";", comment.char = "", na.strings="?")

newPower <- power[66637:69517,]

dateTime <- as.POSIXlt(paste(as.Date(newPower$Date,format="%d/%m/%Y"), newPower$Time, sep = " "))

par(mfrow=c(2,2))

with(newPower, {
	plot(dateTime, newPower$Global_active_power, ylab="Global Active Power (kilowatts)", type = "l", xlab=" ") ##upper left
	plot(dateTime, newPower$Voltage, ylab="Voltage", xlab="datetime", type = "l") ##upper right
	plot(dateTime, newPower$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab=" ")
	lines(dateTime, newPower$Sub_metering_2, col="red")
	lines(dateTime, newPower$Sub_metering_3, col="blue")
	legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1) ##lower right
	plot(dateTime, newPower$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime") ##lower left
})

dev.copy(png, file="plot4.png")
dev.off()