#Plot is a histogram, note that missing data is indicated in data set with ? character
png("plot1.png", width=480, height=480)

data_all <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
data_sub <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))
data_sub$Date <- as.Date(data_sub$Date, format="%d/%m/%Y")
hist(data_sub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()


