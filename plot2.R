setwd("C:/Users/wayfang/Documents/coursera/Exploratory Data Analysis")
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

png("plot2.png", width=480, height= 480)
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()