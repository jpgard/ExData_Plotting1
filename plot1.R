##before running this code, ensure working directory is set to folder containing data

##load requisite packages
library(dplyr)

##read data from file
plot_data <- read.table("./household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

##add column with POSIXct date/time

plot_data$DateTime <- as.POSIXct(strptime(paste(plot_data$Date, plot_data$Time), format="%d/%m/%Y %H:%M:%S"))

##filter only data containing relevant days using Date column

plot_data_sub <- filter(plot_data, Date == "1/2/2007" | Date == "2/2/2007")


##create plot 1 and save to png

png(filename = "Plot 1.png", width = 480, height = 480)
hist(plot_data_sub$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()
