class <- c("character", "character", rep("numeric",7))
power <- read.table("household_power_consumption.txt", colClasses=class, header=TRUE, sep = ";", comment.char = "", na.strings="?")

newPower <- power[66637:69517,]

dateTime <- as.POSIXlt(paste(as.Date(newPower$Date,format="%d/%m/%Y"), newPower$Time, sep = " "))

par(bg="white")

with(newPower, {
	plot(dateTime, newPower$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab=" ")
	lines(dateTime, newPower$Sub_metering_2, col="red")
	lines(dateTime, newPower$Sub_metering_3, col="blue")
	})

legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.copy(png, file="plot3.png")
dev.off()