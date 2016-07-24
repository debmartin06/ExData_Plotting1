#To pull the dataset into a variable. File must be in your working directory.
hpc <- read.table('~/household_power_consumption.txt', na.strings = '?', sep = ';', header = TRUE, stringsAsFactors = FALSE)

#To subset only the Feb 1 and 2 data
hpcsub <- hpc[hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007', ]

#To string date & time data together for x-axis
hpcdt <- strptime(paste(hpcsub$Date, hpcsub$Time, sep = ' '), format = '%d/%m/%Y %H:%M:%S')

#To set up PNG file
png(filename = 'plot4.png', width = 480, height = 480, units = 'px')
par(mfrow = c(2, 2))

#To plot Graph 1
plot(hpcdt, hpcsub$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatts)', type = 'l')

#To plot Graph 2
plot(hpcdt, hpcsub$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')

#To plot Graph 3
plot(hpcdt, hpcsub$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(hpcdt, hpcsub$Sub_metering_2, col = 'red', type = 'l')
lines(hpcdt, hpcsub$Sub_metering_3, col = 'blue', type = 'l')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 'solid', bty = 'n')

#To plot Graph 4
plot(hpcdt, hpcsub$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')

#To turn graphics device off
dev.off()