#To pull the dataset into a variable. File must be in your working directory.
hpc <- read.table('~/household_power_consumption.txt', na.strings = '?', sep = ';', header = TRUE, stringsAsFactors = FALSE)

#To subset only the Feb 1 and 2 data
hpcsub <- hpc[hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007', ]

#To string date & time data together for x-axis
hpcdt <- strptime(paste(hpcsub$Date, hpcsub$Time, sep = ' '), format = '%d/%m/%Y %H:%M:%S')

#To save the line graph as a PNG file
png(filename = 'plot3.png', width = 480, height = 480, units = 'px')
plot(hpcdt, hpcsub$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(hpcdt, hpcsub$Sub_metering_2, col = 'red', type = 'l')
lines(hpcdt, hpcsub$Sub_metering_3, col = 'blue', type = 'l')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 'solid')
dev.off()