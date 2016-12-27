plot3<-function(){


	data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

	subset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
	
	sub_metering1 <- as.numeric(subset$Sub_metering_1,na.rm=TRUE)


	sub_metering2 <- as.numeric(subset$Sub_metering_2,na.rm=TRUE)
	
	sub_metering3 <- as.numeric(subset$Sub_metering_3,na.rm=TRUE)


	datetime<-as.POSIXct(paste(subset$Date, subset$Time), format="%d/%m/%Y %H:%M:%S")
	
	png("plot3.png", width=480, height=480)
	
	with(subset,{
	plot(sub_metering1~datetime,type="l",ylab="Eneergy Sub Metering",col="Black")
	lines(sub_metering2~datetime,col="Blue")
	lines(sub_metering3~datetime,col="Red")

		})
	
	legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	dev.off()
	

}