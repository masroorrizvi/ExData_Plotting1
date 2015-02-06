library(datasets)
library(data.table)


#1 read and subset the data
df.project <- fread("./household_power_consumption.txt", sep = ";", header = T, colClasses = 'character')
df.project <- subset(df.project, df.project$Date =="1/2/2007" | df.project$Date =="2/2/2007")

#2 Convert the date and time into date time posix format
dateTime  <- as.POSIXlt(paste(as.Date(df.project$Date,format="%d/%m/%Y"), df.project$Time, sep=" "))

#3 Create a png file with required dimentions
png<-png(file = "plot3.png",480,480)

#4 Create the plot with submetering_1
plot(dateTime,df.project$Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering",ylim=c(0,40))

#5 Add submetering_2 and submetering_3 to the plot 
lines(dateTime,y=as.numeric(df.project$Sub_metering_2),ylim=c(0,40),col="red")
lines(dateTime,y=as.numeric(df.project$Sub_metering_3),ylim=c(0,40),col="blue")

#6 Add the legend to the plot
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=c(NA,NA,NA),col=c("black","red","blue"),lty=c(1,1,1),xjust=1)

#7 dont forget to close the connection
dev.off()
