library(readr)

# read the data file
df <- read_delim("./data/household_power_consumption.txt",
                 delim = ";", na = c("?", ""),
                 col_types = list(col_date(format = "%d/%m/%Y"), "t", "d", "d", "d", "d", "d", "d", "d"))

# subset the data for given dates
df <- subset(df, df$Date>="2007-02-01" & df$Date<="2007-02-02")

# combine date and time columns
df$DateTime <- as.POSIXct(paste(df$Date, df$Time))

# plot 1
# create png graphic device and create a histogram
png(file = "plot1.png", width = 480, height = 480, units="px")
hist(df$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
