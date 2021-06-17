library(chron)
df <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$Time <- chron(times = df$Time)
df <- df[df$Date >=as.Date("2007-2-1") & df$Date <= as.Date("2007-2-2"),]
df <- df[complete.cases(df),]
dateTime <- as.POSIXct(paste(df$Date,df$Time))


#1
hist(df$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()