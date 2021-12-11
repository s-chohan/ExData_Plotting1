library(readr)

# read the data file
df <- read_delim("./data/household_power_consumption.txt",
                 delim = ";", na = c("?", ""),
                 col_types = list(col_date(format = "%d/%m/%Y"), "t", "d", "d", "d", "d", "d", "d", "d"))

# subset the data for given dates
df <- subset(df, df$Date>="2007-02-01" & df$Date<="2007-02-02")

# combine date and time columns
df$DateTime <- as.POSIXct(paste(df$Date, df$Time))

# plot 2
# turn off locale-specific time format
Sys.setlocale("LC_TIME", "C")

# create a png graphic device
png(file = "plot2.png", width = 480, height = 480, units="px")

# create a line chart with date-time on horizontal axis
plot(x = df$DateTime,
     y = df$Global_active_power,
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
