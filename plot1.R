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

#plot 1
x$Global_active_power <- as.numeric(x$Global_active_power)
title("test2")
hist(x$Global_active_power, col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()

