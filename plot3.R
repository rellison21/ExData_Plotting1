#Exploratory Data Analysis
# Third of 4 plots
# Richard Ellison 5/7/2015

# load library
library(data.table)

# read in ddataset and limit to two days
data_file <- "./Coursera/household_power_consumption.txt"
power_data_full <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
power_data <- power_data_full[power_data_full$Date %in% c("1/2/2007","2/2/2007"),]

# combine date and time for plotting and add to existing ds
power_data$datetime <- strptime(paste(power_data$Date, power_data$Time, sep=" "), "%d/%M/%Y %H:%M:%S")

# set global active power to numeric for hist plotting
#global_active_power <- as.numeric(power_data$Global_active_power)

# set device to png, plot datetime by 3 meter amts, and close device
# plot by the three lines using type n for the container
png("./Coursera/plot3.png", width=480, height=480)
plot(power_data$datetime, power_data$Sub_metering_1, type="n", 
     xlab="", ylab="Energy sub metering")
lines(power_data$datetime, power_data$Sub_metering_1, type="l", col="black")
lines(power_data$datetime, power_data$Sub_metering_2, type="l", col="red")
lines(power_data$datetime, power_data$Sub_metering_3, type="l", col="blue")

#add a legend in the upper right
label <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",label, lwd=2, col=c("black","red","blue"))

dev.off()
