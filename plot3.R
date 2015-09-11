if(file.exists("household_power_consumption.txt")) {
  a <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  Time <- as.POSIXlt(paste(a$Date, a$Time), format = "%d/%m/%Y %T")
  b <- cbind(Time, a[3:9])
  power.data <- subset(b, subset = b$Time >= "2007-02-01 00:00:00" & b$Time < "2007-02-03 00:00:00")
}
png("plot3.png")
plot(power.data$Time, power.data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(power.data$Time, power.data$Sub_metering_1)
lines(power.data$Time, power.data$Sub_metering_2, col = "red")
lines(power.data$Time, power.data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()