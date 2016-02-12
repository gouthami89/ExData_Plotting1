mydata <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, 
			stringsAsFactors = FALSE);

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y");

##Subsetting data

mydata1 <- subset(mydata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"));


#Converting dates
datetime <- paste(as.Date(mydata1$Date), mydata1$Time);
mydata1$DateTime <- as.POSIXct(datetime);

#Plot 3
mydata1$Global_active_power <- as.numeric(mydata1$Global_active_power);

png("plot3.png")

with(mydata1, {
    plot(Sub_metering_1~DateTime, type = "l", ylab = "Global Active Power", xlab = "")
    lines(Sub_metering_2~DateTime, col = "Red")
    lines(Sub_metering_3~DateTime, col = "Blue")
    })
legend("topright", col = c("black", "red", "blue"), lty = 1,  lwd = 2, 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_Metering_3"));

dev.off()


