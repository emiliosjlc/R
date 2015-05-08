install.packages("sqldf")
library("sqldf", lib.loc="~/R/win-library/3.1")
hpc <- read.csv.sql(file = "household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date='2/2/2007'", header =TRUE,sep=";")
dates<-hpc$Date
times<-hpc$Time
hpc$Date<-paste(dates,times)
hpc$Date<-strptime(hpc$Date, "%d/%m/%Y %H:%M:%S")
plot(hpc$Date,hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="Black")
lines(hpc$Date,hpc$Sub_metering_3, type="l", col="Blue")
lines(hpc$Date,hpc$Sub_metering_2, type="l", col="Red")
legend("topright", lty=1,col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_3", "Sub_metering_3"))
dev.copy(png, width=480, height=480, file="Plot3.png")
dev.off()
