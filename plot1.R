mydata <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, 
			stringsAsFactors = FALSE);

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y");

##Subsetting data

mydata1 <- subset(mydata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"));

#Plot 1
mydata1$Global_active_power <- as.numeric(mydata1$Global_active_power);

hist(mydata1$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

png("plot1.png")