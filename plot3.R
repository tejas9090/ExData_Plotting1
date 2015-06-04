## Reading the dataset
powerdata<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings='?')
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
## Sub-setting the data
powerdatasubset<-subset(powerdata,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Creating a new variable with date and time
dateandtime <- paste(as.Date(powerdatasubset$Date), powerdatasubset$Time)
powerdatasubset$DateAndTime <- as.POSIXct(dateandtime)
## Plotting
with(powerdatasubset, {plot(Sub_metering_1~DateAndTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateAndTime,col='Red')
  lines(Sub_metering_3~DateAndTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Writing to file
dev.copy(png, file="plot3.png", height=480, width=580)
dev.off()