library(readr)

# read the data file
df <- read_delim("./data/household_power_consumption.txt",
                 delim = ";", na = c("?", ""),
                 col_types = list(col_date(format = "%d/%m/%Y"), "t", "d", "d", "d", "d", "d", "d", "d"))

# subset the data for given dates
df <- subset(df, df$Date>="2007-02-01" & df$Date<="2007-02-02")

# combine date and time columns
df$DateTime <- as.POSIXct(paste(df$Date, df$Time))

# plot 3
# create a png graphic device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# create a line chart with date-time on horizontal axis
plot(x = df$DateTime, y = df$Sub_metering_1,
     type = "l", xlab = "", ylab = "Energy sub metering")

# draw points on the plot
points(df$DateTime, df$Sub_metering_2, type = "l", col = "red")
points(df$DateTime, df$Sub_metering_3, type = "l", col = "blue")

# drawn a legend on the plot
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
