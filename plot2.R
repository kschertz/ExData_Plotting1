class <- c("character", "character", rep("numeric",7))
power <- read.table("household_power_consumption.txt", colClasses=class, header=TRUE, sep = ";", comment.char = "", na.strings="?")

newPower <- power[66637:69517,]

dateTime <- as.POSIXlt(paste(as.Date(newPower$Date,format="%d/%m/%Y"), newPower$Time, sep = " "))

par(bg="white")

with(newPower, plot(dateTime, newPower$Global_active_power, ylab="Global Active Power (kilowatts)", type = "l", xlab=" "))

dev.copy(png, file="plot2.png")
dev.off()