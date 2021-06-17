library(chron)
df <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$Time <- chron(times = df$Time)
df <- df[df$Date >=as.Date("2007-2-1") & df$Date <= as.Date("2007-2-2"),]
df <- df[complete.cases(df),]
dateTime <- as.POSIXct(paste(df$Date,df$Time))

#3
plot(df$Sub_metering_1~dateTime, type="l", ylab="Energy sub metering", xlab="")
lines(df$Sub_metering_2~dateTime,col='Red')
lines(df$Sub_metering_3~dateTime,col='Blue')

legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()