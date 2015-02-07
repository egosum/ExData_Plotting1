# Read the data we need
data <- read.table("household_power_consumption.txt", 
                   sep=";", 
                   skip = 66637, 
                   nrows = 2880, 
                   col.name = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Create dates variable for the "x" axis
dates <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "transparent")

# Create the plot
plot(dates, data$Sub_metering_1, "l", col="black", xlab = "", ylab = "Energy sub metering")
lines(dates, data$Sub_metering_2, "l", col="red")
lines(dates, data$Sub_metering_3, "l", col="blue")

# Create the legend
legend("topright", lty = c(1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close the device
dev.off()