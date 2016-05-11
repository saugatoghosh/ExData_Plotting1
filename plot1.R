#Read and subset data

data <- read.table("household_power_consumption.txt", header =TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
power <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

#Explore data
str(power)

#Transform variable of interest to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)

#Change graphics device and send plot
windows()
png("plot1.png", width = 480, height = 480)

hist(power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()


