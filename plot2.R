library(datasets)
library(data.table)


#1 read and subset the data
df.project <- fread("./household_power_consumption.txt", sep = ";", header = T, colClasses = 'character')
df.project <- subset(df.project, df.project$Date =="1/2/2007" | df.project$Date =="2/2/2007")

#2 Convert the date and time into date time posix format
dateTime  <- as.POSIXlt(paste(as.Date(df.project$Date,format="%d/%m/%Y"), df.project$Time, sep=" "))

#3 Create the plot
plot(dateTime,df.project$Global_active_power,type = "l", xlab = " ", ylab = "Global Active Power (Kilowatts)")

#4 Create the PNG
dev.copy(png, file = "plot2.png")

#5 Dont forget to close the connection
dev.off()