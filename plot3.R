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

#plot 3
par(mfrow = c(1,1))
plot(x$DateTime, x$Sub_metering_1,  type="l", xlab='', ylab="Energy sub metering")
lines(x$DateTime, x$Sub_metering_2, col='red', type="l")
lines(x$DateTime, x$Sub_metering_3, col='blue',type="l")
legend("topright",  lwd = 1, col=c('black','red','blue'), legend=c('Sub metering 1','Sub metering 2','Sub metering 3'))

dev.copy(png, file="plot3.png")
dev.off()
