setwd("D:\\rprogram\\plot")
class<-c("character","character","character","character","character","character","character","character","character")
household<-read.table("D:\\rprogram\\plot\\household_power_consumption.txt", header = TRUE, sep = ";", quote = "\"'",colClasses = class)
as.Date(household$Date, "%d/%m/%Y")->household$Date
#install.packages("lubridate")
library(lubridate)
subset(household,year(household$Date)==2007&month(household$Date)==02)->household200702
subset(household200702,day(household200702$Date)==02|day(household200702$Date)==01)->household200702
#########################################################
as.numeric(household200702$Global_reactive_power)->household200702$Global_reactive_power
as.numeric(household200702$Voltage)->household200702$Voltage
#plot4.png
png(file="plot4.png")
par(mfrow=c(2,2))
with(household200702,{
  plot(household200702$datetime,household200702$Global_active_power,xlab = "",ylab="Global Active Power(kilowatts)",type="l")
})

with(household200702,{
  plot(household200702$datetime,household200702$Voltage,xlab = "datetime",ylab="Voltage",type="l")
})
with(household200702,{
  plot(household200702$datetime,household200702$Sub_metering_1,type="s",xlab="",ylab="Energy sub metering")
  lines(household200702$datetime,household200702$Sub_metering_2,type="s",col="red")
  lines(household200702$datetime,household200702$Sub_metering_3,type="s",col="blue")
  legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
})
with(household200702,{
  plot(household200702$datetime,household200702$Global_reactive_power,xlab ="datetime",ylab="Global_rective_ power",type="l")
})
dev.off()