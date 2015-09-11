
if(file.exists("household_power_consumption.txt")) {
  a <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  Time <- as.POSIXlt(paste(a$Date, a$Time), format = "%d/%m/%Y %T")
  b <- cbind(Time, a[3:9])
  power.data <- subset(b, subset = b$Time >= "2007-02-01 00:00:00" & b$Time < "2007-02-03 00:00:00")
}
png("plot4.png", type = "cairo-png") #cairo=png seems to render the lines better, so there is less overlap
par(mfrow = c(2, 2))#Sets the 2 x 2 arrangement for the graph output
#Upper left plot, Global Active Power vs. Time
plot(power.data$Time, power.data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(power.data$Time, power.data$Global_active_power)
#Upper right plot, Voltage vs. datetime
plot(power.data$Time, power.data$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(power.data$Time, power.data$Voltage)
#Lower left plot, Energy sub metering vs. time
plot(power.data$Time, power.data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(power.data$Time, power.data$Sub_metering_1)
lines(power.data$Time, power.data$Sub_metering_2, col = "red")
lines(power.data$Time, power.data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty = c(1, 1, 1), col = c("black", "red", "blue"))
#Lower right plot, Global Reactive Power vs. Time
plot(power.data$Time, power.data$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(power.data$Time, power.data$Global_reactive_power)
dev.off()