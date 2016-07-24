#To pull the dataset into a variable. File must be in your working directory.
hpc <- read.table('~/household_power_consumption.txt', na.strings = '?', sep = ';', header = TRUE, stringsAsFactors = FALSE)

#To format Date
hpc$Date <- as.Date(hpc$Date, format = '%d/%m/%Y')

#To subset only the Feb 1 and 2 data
hpcsub <- hpc[hpc$Date == '2007-02-01' | hpc$Date == '2007-02-02', ]

#To plot the histogram for Plot 1
hist(hpcsub$Global_active_power, freq = TRUE, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')
dev.off()

#To save the histogram as a PNG file
png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
hist(hpcsub$Global_active_power, freq = TRUE, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')
dev.off()