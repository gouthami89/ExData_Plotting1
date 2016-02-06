mydata <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, 
			stringsAsFactors = FALSE);

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y");

##Subsetting data

mydata1 <- subset(mydata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"));


#Converting dates
datetime <- paste(as.Date(mydata1$Date), mydata1$Time);
mydata1$DateTime <- as.POSIXct(datetime);

#Plot 2
mydata1$Global_active_power <- as.numeric(mydata1$Global_active_power);

plot(mydata1$Global_active_power~mydata1$DateTime, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

png("plot2.png")