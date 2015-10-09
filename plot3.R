data<-read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)

# Setting locale for "english" weekdays
Sys.setlocale("LC_ALL","English")

cutdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
transdata<-transform(cutdata, Date = paste(Date,Time, sep = " "))
transdata2<-transform(transdata, Date = strptime(Date, format = "%d/%m/%Y %H:%M:%S"))

png(filename = "plot3.png", width = 480, height = 480)
plot(transdata2$Date, transdata2$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(transdata2$Date, transdata2$Sub_metering_1, col = "black")
lines(transdata2$Date, transdata2$Sub_metering_2, col = "red")
lines(transdata2$Date, transdata2$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
dev.off()