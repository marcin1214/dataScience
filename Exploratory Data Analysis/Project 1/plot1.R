# read source file
d <- read.csv2("household_power_consumption.txt", na.strings = "?", sep = ";", header=T, stringsAsFactor=F)
d_subset <- subset(d, Date == "1/2/2007")
d_subset <- rbind(d_subset, subset(d, Date == "2/2/2007"))

# set datetime from date and time
d_subset$DateTime <- strptime(paste(d_subset$Date, d_subset$Time), "%d/%m/%Y %H:%M:%S" )

#convert to numeric
d_subset$Global_active_power <- as.numeric(d_subset$Global_active_power)

# create historgramm and put into file
png("plot1.png", width=480, height=480)
hist(d_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red")
dev.off()