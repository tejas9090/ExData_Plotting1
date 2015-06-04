# Reading the dataset
powerdata<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings='?')
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
## Sub-setting the data
powerdatasubset<-subset(powerdata,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Creating a new variable with date and time
dateandtime <- paste(as.Date(powerdatasubset$Date), powerdatasubset$Time)
powerdatasubset$DateAndTime <- as.POSIXct(dateandtime)
## Plotting
plot(powerdatasubset$Global_active_power~powerdatasubset$DateAndTime,type='l',ylab="Global Active Power (kilowatts)", xlab="")
## Writing to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
