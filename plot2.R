setwd("D:\\rprogram\\plot")
class<-c("character","character","character","character","character","character","character","character","character")
household<-read.table("D:\\rprogram\\plot\\household_power_consumption.txt", header = TRUE, sep = ";", quote = "\"'",colClasses = class)
as.Date(household$Date, "%d/%m/%Y")->household$Date
#install.packages("lubridate")
library(lubridate)
subset(household,year(household$Date)==2007&month(household$Date)==02)->household200702
subset(household200702,day(household200702$Date)==02|day(household200702$Date)==01)->household200702
###########################################################
#plot2.png
library(dplyr)
household200702<-mutate(household200702,datetime=paste(household200702$Date,household200702$Time))
strptime(household200702$datetime,"%Y-%m-%d %H:%M:%S",tz="GMT")->household200702$datetime
png(file="plot2.png")
plot(household200702$datetime,household200702$Global_active_power,xlab = "",ylab="Global Active Power(kilowatts)",type="l")
#axis(1,at=g_range2,lab=c("Thu","Fri","Sta"))
#axis(2,at=2*0:g_range1[2])
dev.off()
