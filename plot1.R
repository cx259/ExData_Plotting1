setwd("D:\\rprogram\\plot")
class<-c("character","character","character","character","character","character","character","character","character")
household<-read.table("D:\\rprogram\\plot\\household_power_consumption.txt", header = TRUE, sep = ";", quote = "\"'",colClasses = class)
as.Date(household$Date, "%d/%m/%Y")->household$Date
#install.packages("lubridate")
library(lubridate)
subset(household,year(household$Date)==2007&month(household$Date)==02)->household200702
subset(household200702,day(household200702$Date)==02|day(household200702$Date)==01)->household200702
###########################################################
#plot1.png
png(file="plot1.png")
hist(as.numeric(household200702$Global_active_power),col="red",xlab = "Global Active Power(kilowatts)",main="Global Active Power")
dev.off()