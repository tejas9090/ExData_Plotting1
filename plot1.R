# Reading the dataset
powerdata<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings='?')
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
## Sub-setting the data
powerdatasubset<-subset(powerdata,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Creating a new variable with date and time
dateandtime <- paste(as.Date(powerdatasubset$Date), powerdatasubset$Time)
powerdatasubset$DateAndTime <- as.POSIXct(dateandtime)
## Plotting
hist(powerdatasubset$Global_active_power,xlab = "Global Active Power (killowatts)",col="red",main="Global Active Power")
## Writing to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

