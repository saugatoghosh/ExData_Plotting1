#Read and subset data

data <- read.table("household_power_consumption.txt", header =TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
power <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

#Explore data
str(power)

#Transform variable of interest 
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(power$Date), power$Time)

power$Datetime <- as.POSIXct(datetime)


#Create plot and send to png

plot(power$Global_active_power ~ power$Datetime, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
