if(file.exists("household_power_consumption.txt")) {
  a <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  Time <- as.POSIXlt(paste(a$Date, a$Time), format = "%d/%m/%Y %T")
  b <- cbind(Time, a[3:9])
  power.data <- subset(b, subset = b$Time >= "2007-02-01 00:00:00" & b$Time < "2007-02-03 00:00:00")
}
png("plot1b.png")
hist(as.numeric(power.data$Global_active_power) / 500, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", freq = TRUE, col = "red")
dev.off()