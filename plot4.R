#Exploratory Data Analysis
# Fourth of 4 plots
# Richard Ellison 5/8/2015

# load library
library(data.table)

# read in ddataset and limit to two days
data_file <- "./Coursera/household_power_consumption.txt"
power_data_full <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
power_data <- power_data_full[power_data_full$Date %in% c("1/2/2007","2/2/2007"),]

# combine date and time for plotting and add to existing ds
power_data$datetime <- strptime(paste(power_data$Date, power_data$Time, sep=" "), "%d/%M/%Y %H:%M:%S")
power_data$datetime <- as.POSIXct(datetime)

# set device to png and parm for 2 by 2 plot position
png("./Coursera/plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

# plot four graphs
with(power_data, {
        plot(global_active_power~datetime, type="l",
             ylab="Global Active Power", xlab="")
        plot(Voltage~datetime, type="l",
             ylab="Voltage", xlab="")
        plot(Sub_metering_1~datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~datetime, col="red")
        lines(Sub_metering_3~datetime, col="blue")
        label <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        legend("topright",label, lty=, lwd=2.5, col=c("black","red","blue"))
        plot(Global_reactive_power~datetime, type="l",
             ylab="Global_reactive_power",xlab="")
})

dev.off()
