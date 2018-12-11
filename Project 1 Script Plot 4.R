# Plot four shows 

png("plot3.png", width=480, height=480)

data_all <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                     nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
data_sub <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))
data_sub$Date <- as.Date(data_sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_sub, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=3, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)")
})

dev.off()