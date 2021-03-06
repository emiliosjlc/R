install.packages("sqldf")
library("sqldf", lib.loc="~/R/win-library/3.1")
hpc <- read.csv.sql(file = "household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date='2/2/2007'", header =TRUE,sep=";")
dates<-hpc$Date
times<-hpc$Time
hpc$Date<-paste(dates,times)
hpc$Date<-strptime(hpc$Date, "%d/%m/%Y %H:%M:%S")
plot1<-hist(hpc$Global_active_power, col= "Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, width=480, height=480, file="Plot1.png")
dev.off()
