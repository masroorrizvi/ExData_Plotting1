library(datasets)
library(data.table)


#1 read and subset the data
df.project <- fread("./household_power_consumption.txt", sep = ";", header = T, colClasses = 'character')
df.project <- subset(df.project, df.project$Date =="1/2/2007" | df.project$Date =="2/2/2007")

#4 Create a png file with required dimentions
png<-png(file = "plot4.png",480,480)

#3 Give the par value for the plot
par(mfcol = c(2,2))

#5 Let us create the Global Active power line plot 
dateTime  <- as.POSIXlt(paste(as.Date(df.project$Date,format="%d/%m/%Y"), df.project$Time, sep=" "))
plot(dateTime,df.project$Global_active_power,type = "l", xlab = " ", ylab = "Global Active Power (Kilowatts)")

#6 Let us now create the energy submetering plot
plot(dateTime,df.project$Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering",ylim=c(0,40))
lines(dateTime,y=as.numeric(df.project$Sub_metering_2),ylim=c(0,40),col="red")
lines(dateTime,y=as.numeric(df.project$Sub_metering_3),ylim=c(0,40),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=c(NA,NA,NA),col=c("black","red","blue"),lty=c(1,1,1),xjust=1)

#7 Time to create the 3rd plot for voltage
plot(dateTime,y=as.numeric(df.project$Voltage),type="l",ylab="Voltage")


#8 Lastly, create the plot for Global Reactive Power
plot(dateTime,y=as.numeric(df.project$Global_reactive_power),type="l",ylab="Global_reactive_power")



# Dont forget to close the connection
dev.off()