library(readr)

# read the data file
df <- read_delim("./data/household_power_consumption.txt",
                 delim = ";", na = c("?", ""),
                 col_types = list(col_date(format = "%d/%m/%Y"), "t", "d", "d", "d", "d", "d", "d", "d"))

# subset the data for given dates
df <- subset(df, df$Date>="2007-02-01" & df$Date<="2007-02-02")

# combine date and time columns
df$DateTime <- as.POSIXct(paste(df$Date, df$Time))

# plot 4
# create a png graphic device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# set parameters to two-by-two matrix and set margins
par(mfrow=c(2,2), mar=c(4,4,2,1))

# draw subplot 1
plot(x = df$DateTime, y = df$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power")

# draw subplot 2
plot(df$DateTime, df$Voltage,
     type = "l", xlab = "datetime", ylab = "Voltage")

# draw subplot 3
plot(df$DateTime, df$Sub_metering_1,
     type = "l", xlab = "", ylab = "Energy sub metering")
points(df$DateTime, df$Sub_metering_2, type = "l", col = "red")
points(df$DateTime, df$Sub_metering_3, type = "l", col = "blue")
legend("topright",
       lty = c(1, 1, 1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.7, y.intersp = 0.9, bty = "n")

# draw subplot 4
plot(df$DateTime, df$Global_reactive_power,
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
