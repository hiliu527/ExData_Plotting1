ALLData<-read.csv("F://household_power_consumption.txt",header=T,sep=';',na.strings="?",
        nrows=2075259,check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

ALLData$Date <- as.Date(ALLData$Date, format="%d/%m/%Y")

data <- subset(ALLData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(ALLData)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
