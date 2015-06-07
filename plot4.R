setwd("C:/Users/wayfang/Documents/coursera/Exploratory Data Analysis")
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

png("plot4.png", width = 480, height = 480)
# create four subplots
par(mfrow=c(2,2)) 
# top left
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 
# top right
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")   
# bottom left
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 
# bottom right
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  
dev.off()