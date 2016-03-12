NEI <- readRDS("exploratory/summarySCC_PM25.rds")
SCC <- readRDS("exploratory/Source_Classification_Code.rds")

# create new data frame that is aggregate by year
newDF = aggregate(NEI$Emissions,  by = list(NEI$year), FUN = "sum")
names(newDF) <- c("Year","Emission")

png(filename='plot1.png')

with(newDF, barplot(Emission, Year, xlab = "Year", ylab = "Emission", main = "Total emission per year", names.arg = newDF$Year))

dev.off()

