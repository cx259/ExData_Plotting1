setwd("D:\\rprogram\\plot")
class<-c("character","character","character","character","character","character","character","character","character")
household<-read.table("D:\\rprogram\\plot\\household_power_consumption.txt", header = TRUE, sep = ";", quote = "\"'",colClasses = class)
as.Date(household$Date, "%d/%m/%Y")->household$Date
#install.packages("lubridate")
library(lubridate)
subset(household,year(household$Date)==2007&month(household$Date)==02)->household200702
subset(household200702,day(household200702$Date)==02|day(household200702$Date)==01)->household200702
###########################################################
#plot3.png
as.numeric(household200702$Sub_metering_1)->household200702$Sub_metering_1
as.numeric(household200702$Sub_metering_2)->household200702$Sub_metering_2
as.numeric(household200702$Sub_metering_3)->household200702$Sub_metering_3

png(file="plot3.png")
plot(household200702$datetime,household200702$Sub_metering_1,type="s",xlab="",ylab="Energy sub metering")
lines(household200702$datetime,household200702$Sub_metering_2,type="s",col="red")
lines(household200702$datetime,household200702$Sub_metering_3,type="s",col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1", 
                                                                    "Sub_metering_2","Sub_metering_3"))
dev.off()
