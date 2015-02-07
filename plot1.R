class <- c("character", "character", rep("numeric",7))
power <- read.table("household_power_consumption.txt", colClasses=class, header=TRUE, sep = ";", comment.char = "", na.strings="?")

newPower <- power[66637:69517,]

dateTime <- as.POSIXlt(paste(as.Date(newPower$Date,format="%d/%m/%Y"), newPower$Time, sep = " "))

par(bg="white")

hist(newPower$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()