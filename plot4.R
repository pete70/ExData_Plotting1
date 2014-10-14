setwd('C:\\temp\\R\\R-3.1.0\\bin\\x64')
#setwd('~/Downloads/classes/jh-exploratoryAnalysis/projects/proj1')

#install.packages("data.table")
#install.packages("lubridate")

require(data.table)
require(lubridate)

# read file faster
x <- fread('household_power_consumption.txt', stringsAsFactors = F)

# convert date to proper date
x$Date <- dmy(x$Date)

# subset to 2/1/2007 and 2/2/2007
x <- x[year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2)]
x$DateTime <- x$Date + hms(x$Time)

#plot 4
par(mfrow = c(2,2))
plot(x$DateTime, x$Global_active_power, type='l', ylab='Global Active Power', xlab='')
plot(x$DateTime, x$Voltage, type='l', ylab='Voltage', xlab='datetime')
plot(x$DateTime, x$Sub_metering_1,  type="l", xlab='', ylab="Energy sub metering")
lines(x$DateTime, x$Sub_metering_2, col='red', type="l")
lines(x$DateTime, x$Sub_metering_3, col='blue',type="l")
legend("topright", cex = 0.5, bty = 'n', lwd = 1, col=c('black','red','blue'), legend=c('Sub metering 1','Sub metering 2','Sub metering 3'))
plot(x$DateTime, x$Global_reactive_power, type='l', ylab='Global_reactive_power', xlab='')
dev.copy(png, file="plot4.png")
dev.off()
