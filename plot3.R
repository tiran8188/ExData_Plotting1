rm(list = ls())
library(dplyr)

df<-read.table("household_power_consumption.txt",sep = ";",header = T,stringsAsFactors = F,na.strings = "?")

df$Date<-as.Date(df$Date, format = "%d/%m/%Y")

subset_df<-subset(df,subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

subset_df$DateTIme<-paste(subset_df$Date,subset_df$Time)
subset_df$DateTIme<-strptime(subset_df$DateTIme,"%Y-%m-%d %H:%M:%S")

subset_df$Global_active_power<-as.numeric(as.character(subset_df$Global_active_power))
subset_df$Global_reactive_power<-as.numeric(as.character(subset_df$Global_reactive_power))
subset_df$Sub_metering_1<-as.numeric(as.character(subset_df$Sub_metering_1))
subset_df$Sub_metering_2<-as.numeric(as.character(subset_df$Sub_metering_2))
subset_df$Sub_metering_3<-as.numeric(as.character(subset_df$Sub_metering_3))

plot(subset_df$DateTIme,subset_df$Sub_metering_1,type = "l",xlab="",ylab = "Energy sub metering")
lines(subset_df$DateTIme,subset_df$Sub_metering_2,type = "l",col="red")     ##add line graph of sub_metering2
lines(subset_df$DateTIme,subset_df$Sub_metering_3,type = "l",col="blue")
legend("topright",lty = 1,col = c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))  ## adding legend
dev.copy(png,file="plot3.png",height=600,width=600) ## copying graph into png file of size 600 by 600
dev.off() ##closing graphic device
