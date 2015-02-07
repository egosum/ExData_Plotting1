# Read the data we need
data <- read.table("household_power_consumption.txt", 
                   sep=";", 
                   skip = 66637, 
                   nrows = 2880, 
                   col.name = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# This is for the "x" axis labels, if default language is not English
# Can be commented if your default language is English
Sys.setlocale("LC_TIME", "C")

# Create dates variable for the "x" axis
dates <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Open png device
png("plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "transparent")

# Create the plot
plot(dates, data$Global_active_power, "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Close the device
dev.off()