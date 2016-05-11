#Read and subset data

data <- read.table("household_power_consumption.txt", header =TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
power <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

#Explore data
str(power)

#Transform variable of interest 

power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(datetime)

#Create Plot

with(power, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Send to png

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()
