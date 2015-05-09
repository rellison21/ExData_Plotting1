#Exploratory Data Analysis
# First of 4 plots
# Richard Ellison 5/7/2015

# load library
library(data.table)

# read in ddataset and limit to two days
data_file <- "./Coursera/household_power_consumption.txt"
power_data_full <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
power_data <- power_data_full[power_data_full$Date %in% c("1/2/2007","2/2/2007"),]

# set global active power to numeric for hist plotting
global_active_power <- as.numeric(power_data$Global_active_power)

# set device to png, plot histogram and close device
png("./Coursera/plot1.png", width=480, height=480)
hist(global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency",
     col="Red")
dev.off()
