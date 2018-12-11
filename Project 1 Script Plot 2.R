#Plot is a line graph, no special x label

png("plot2.png", width=480, height=480)

data_all <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                     nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
data_sub <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))
data_sub$Date <- as.Date(data_sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)
with(data_sub, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)")
})

dev.off()
