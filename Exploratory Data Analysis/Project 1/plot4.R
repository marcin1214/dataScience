# read source file
d <- read.csv2("household_power_consumption.txt", na.strings = "?", sep = ";", header=T, stringsAsFactor=F)
d_subset <- subset(d, Date == "1/2/2007")
d_subset <- rbind(d_subset, subset(d, Date == "2/2/2007"))

# set datetime from date and time
d_subset$DateTime <- strptime(paste(d_subset$Date, d_subset$Time), "%d/%m/%Y %H:%M:%S" )

#convert to numeric
d_subset$Global_active_power <- as.numeric(d_subset$Global_active_power)
d_subset$Sub_metering_1 <- as.numeric(d_subs?et$Sub_metering_1)
d_subset$Sub_metering_2 <- as.numeric(d_subset$Sub_metering_2)
d_subset$Sub_metering_3 <- as.numeric(d_subset$Sub_metering_3)

# create plots and put into file

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

#Plo1
plot(d_subset$DateTime, d_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Poer (killowats)")

#Plot2
plot(d_subset$DateTime, d_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot3
plot(d_subset$DateTime, d_subset$Sub_metering_1 , xlab ="", ylab = "Energy sub metering", type = "l", col = "black")
lines(d_subset$DateTime, d_subset$Sub_metering_2 ,  type = "l", col = "red")
lines(d_subset$DateTime, d_subset$Sub_metering_3 ,  type = "l", col = "blue")
legend("topright",lty = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

#Plot4
plot(d_subset$DateTime, d_subset$Global_reactive_power , type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()