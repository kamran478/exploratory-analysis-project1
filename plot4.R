plot4<-function(){


	data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

	subset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
	
	sub_metering1 <- as.numeric(subset$Sub_metering_1,na.rm=TRUE)


	sub_metering2 <- as.numeric(subset$Sub_metering_2,na.rm=TRUE)
	
	sub_metering3 <- as.numeric(subset$Sub_metering_3,na.rm=TRUE)


	
	datetime<-as.POSIXct(paste(subset$Date, subset$Time), format="%d/%m/%Y %H:%M:%S")
	
	G.A.P <- as.numeric(subset$Global_active_power,na.rm=TRUE)

	voltage<- as.numeric(subset$Voltage,na.rm=TRUE)

	G.R.P <- as.numeric(subset$Global_reactive_power,na.rm=TRUE)

	png("plot4.png", width=480, height=480)
	

	
	par(mfrow=c(2,2))
	

	plot(G.A.P~datetime,type="l",ylab="Global Active Power",col="Black")


	plot(voltage~datetime,type="l",ylab="Voltage",col="Black")



	with(subset,{
	plot(sub_metering1~datetime,type="l",ylab="Eneergy Sub Metering",col="Black")
	lines(sub_metering2~datetime,col="Blue")
	lines(sub_metering3~datetime,col="Red")

		})
	
	legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,cex=0.7, pt.cex = 0.5, 
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	
	
	

	plot(G.R.P~datetime,type="l",ylab="Global Reactive Power",col="Black")




	
	dev.off()
	

}