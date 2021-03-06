library(datasets)
library(data.table)

#1 read and subset the data
df.project <- fread("./household_power_consumption.txt", sep = ";", header = T, colClasses = 'character')
df.project <- subset(df.project, df.project$Date =="1/2/2007" | df.project$Date =="2/2/2007")

#2 Create a png file with required dimentions
png<-png(file = "plot1.png",480,480)

#3 Create the histogram
hist(as.numeric(df.project$Global_active_power), col='red', xlab = "Global Active Power (Kilowatts)",main="Global Active Power")

#4 Dont forget to close the connection
dev.off()

