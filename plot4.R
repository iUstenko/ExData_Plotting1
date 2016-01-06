# Exploratory Data Analysis | Programming Assignment 1
# Plot 4

# Getting data
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              destfile = 'electric_power_consumtion.zip')
unzip('Electric_power_consumtion.zip', exdir = 'Assignment_1')

# Import and Prepare Data
temp <- read.delim(list.files("Assignment_1", full.names = TRUE),
                   header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
hpc <- subset(temp, Date == '1/2/2007' | Date == '2/2/2007')
rm(temp)

hpc$Time <- paste(hpc$Date, hpc$Time, sep = ' ')
hpc$Date <- as.Date(hpc$Date, '%d/%m/%Y')
hpc$Time <- strptime(hpc$Time, '%d/%m/%Y %H:%M:%S')


# Plot
png(filename = 'plot4.png', bg = 'transparent', width = 480, height = 480, units = 'px')
par(mfrow = c(2, 2), mar = c(5, 5, 2, 2))
plot(x = hpc$Time, y = hpc$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power')
plot(x = hpc$Time, y = hpc$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')
plot(x = hpc$Time, y = hpc$Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy sub metering')
lines(x = hpc$Time, y = hpc$Sub_metering_1)
lines(x = hpc$Time, y = hpc$Sub_metering_2, col = 'red')
lines(x = hpc$Time, y = hpc$Sub_metering_3, col = 'blue')
legend('topright', bty = 'n', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       lty = c(1, 1, 1), col = c('black', 'red', 'blue'))
plot(x = hpc$Time, y = hpc$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()