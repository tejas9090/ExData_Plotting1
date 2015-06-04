## Reading the dataset
powerdata<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings='?')
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
## Sub-setting the data
powerdatasubset<-subset(powerdata,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Creating a new variable with date and time
dateandtime <- paste(as.Date(powerdatasubset$Date), powerdatasubset$Time)
powerdatasubset$DateAndTime <- as.POSIXct(dateandtime)
## Plotting
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(powerdatasubset, {
  plot(Global_active_power~DateAndTime,, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DateAndTime,, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~DateAndTime,, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateAndTime,,col='Red')
  lines(Sub_metering_3~DateAndTime,,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateAndTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()