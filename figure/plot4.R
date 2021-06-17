library(chron)
df <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$Time <- chron(times = df$Time)
df <- df[df$Date >=as.Date("2007-2-1") & df$Date <= as.Date("2007-2-2"),]
df <- df[complete.cases(df),]
dateTime <- as.POSIXct(paste(df$Date,df$Time))


#4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(df$Global_active_power ~ dateTime , type = "l",ylab="Global Active Power (kilowatts)", xlab="")
plot(df$Voltage ~ dateTime , type = "l",ylab="Voltage", xlab="datetime")
plot(df$Sub_metering_1~dateTime, type="l", ylab="Energy sub metering", xlab="")
lines(df$Sub_metering_2~dateTime,col='Red')
lines(df$Sub_metering_3~dateTime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(df$Global_reactive_power ~ dateTime , type = "l",ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
