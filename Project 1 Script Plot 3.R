# Plot three shows all 3 submetering cases, in different colors. XLab is not special.

png("plot3.png", width=480, height=480)

data_all <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                     nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
data_sub <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))
data_sub$Date <- as.Date(data_sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)
with(data_sub, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=3, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()