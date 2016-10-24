setwd("E:/Abhishek/Personal/Analytics/John Hopkins Data Science/Courses/Course 4 Exploratory Data Analysis/Week 1/Assignment and Practice/household_power_consumption")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#str(subSetData)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetdata$Global_active_power)

sub_meter_1 <- as.numeric(subsetdata$Sub_metering_1)
sub_meter_2 <- as.numeric(subsetdata$Sub_metering_2)
sub_meter_3 <- as.numeric(subsetdata$Sub_metering_3)
voltage <- as.numeric(subsetdata$Voltage)
global_react_pow <-as.numeric(subsetdata$Global_reactive_power)

plot("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power ",cex=0.2)
plot(datetime, voltage, type="l", xlab="Datetime", ylab="Voltage")

plot(datetime, sub_meter_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_meter_2, type="l", col="red")
lines(datetime, sub_meter_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, global_react_pow, type="l", xlab="", ylab="Global_Reactive_Power ")
dev.off()

