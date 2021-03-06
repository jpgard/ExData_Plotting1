##before running this code, ensure working directory is set to folder containing data

##load requisite packages
library(dplyr)

##read data from file
plot_data <- read.table("./household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

##add column with POSIXct date/time

plot_data$DateTime <- as.POSIXct(strptime(paste(plot_data$Date, plot_data$Time), format="%d/%m/%Y %H:%M:%S"))

##filter only data containing relevant days using Date column

plot_data_sub <- filter(plot_data, Date == "1/2/2007" | Date == "2/2/2007")

##create plot 4
png(filename = "Plot 4.png", width = 480, height = 480)
par(mfcol = c(2, 2))

##top left plot
plot(plot_data_sub$DateTime, plot_data_sub$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power")

##bottom left plot
plot(plot_data_sub$DateTime, plot_data_sub$Sub_metering_1, type="l", xlab = NA, ylab = "Energy sub metering")
lines(plot_data_sub$DateTime, plot_data_sub$Sub_metering_2, type="l", col = "red")
lines(plot_data_sub$DateTime, plot_data_sub$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c(names(plot_data_sub)[7:9]), col = c("black", "red", "blue"), lty=1, cex=0.8, bty = "n")

##top right plot
plot(plot_data_sub$DateTime, plot_data_sub$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

##bottom right plot
plot(plot_data_sub$DateTime, plot_data_sub$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
