#To pull the dataset into a variable. File must be in your working directory.
hpc <- read.table('~/household_power_consumption.txt', na.strings = '?', sep = ';', header = TRUE, stringsAsFactors = FALSE)

#To subset only the Feb 1 and 2 data
hpcsub <- hpc[hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007', ]

#To string date & time data together for x-axis
hpcdt <- strptime(paste(hpcsub$Date, hpcsub$Time, sep = ' '), format = '%d/%m/%Y %H:%M:%S')

#To plot the line graph for PLot 2 on the Screen Device
plot(hpcdt, y = hpcsub$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()

#To save the line graph as a PNG file
png(filename = 'plot2.png', width = 480, height = 480, units = 'px')
plot(hpcdt, y = hpcsub$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()