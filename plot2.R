data<-read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)

# Setting locale for "english" weekdays
Sys.setlocale("LC_ALL","English")

cutdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
transdata<-transform(cutdata, Date = paste(Date,Time, sep = " "))
transdata2<-transform(transdata, Date = strptime(Date, format = "%d/%m/%Y %H:%M:%S"))

png(filename = "plot2.png", width = 480, height = 480)
plot(transdata2$Date, transdata2$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()