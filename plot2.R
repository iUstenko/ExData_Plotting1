# Exploratory Data Analysis | Programming Assignment 1
# Plot 2

# Getting data
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              destfile = 'electric_power_consumtion.zip')
unzip('electric_power_consumtion.zip', exdir = 'Assignment_1')

# Import and Prepare Data
temp <- read.delim(list.files("Assignment_1", full.names = TRUE), 
                   header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
hpc <- subset(temp, Date == '1/2/2007' | Date == '2/2/2007')
rm(temp)

hpc$Time <- paste(hpc$Date, hpc$Time, sep = ' ')
hpc$Date <- as.Date(hpc$Date, '%d/%m/%Y')
hpc$Time <- strptime(hpc$Time, '%d/%m/%Y %H:%M:%S')

# Plot
png(filename = 'plot2.png', bg = 'transparent', width = 480, height = 480, units = 'px')
plot(x = hpc$Time, y = hpc$Global_active_power, 
     ylab = 'Global Active Power (kilowatts)', 
     xlab = '', 
     type = 'l')
dev.off()
