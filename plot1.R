rm(list = ls())
library(dplyr)

df<-read.table("household_power_consumption.txt",sep = ";",header = T,stringsAsFactors = F,na.strings = "?")

df$Date<-as.Date(df$Date, format = "%d/%m/%Y") ##convert Date column to date format

subset_df<-subset(df,subset = (Date >= "2007-02-01" & Date <= "2007-02-02")) ##subset data between 2007-2-1 & 2007-2-2

subset_df$DateTIme<-paste(subset_df$Date,subset_df$Time) ## New column of DateTime is created
subset_df$DateTIme<-strptime(subset_df$DateTIme,"%Y-%m-%d %H:%M:%S") ## DateTime column converted to time format

subset_df$Global_active_power<-as.numeric(as.character(subset_df$Global_active_power))  ##converting to numerical values 
subset_df$Global_reactive_power<-as.numeric(as.character(subset_df$Global_reactive_power)) ##converting to numerical values 
subset_df$Sub_metering_1<-as.numeric(as.character(subset_df$Sub_metering_1)) ##converting to numerical values 
subset_df$Sub_metering_2<-as.numeric(as.character(subset_df$Sub_metering_2)) ##converting to numerical values 
subset_df$Sub_metering_3<-as.numeric(as.character(subset_df$Sub_metering_3)) ##converting to numerical values 
 
hist(subset_df$Global_active_power,main = "Global Active Power",xlab = "Global Actuve Power (kilowatts)",ylab = "Frequency",col="Red")
dev.copy(png,file="plot1.png",height=600,width=600) ## copying graph into png file of size 480 by 480
dev.off() ##closing graphic device

