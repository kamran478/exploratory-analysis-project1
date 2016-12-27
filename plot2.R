plot2<-function(){


	data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

	subset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
	
	G.A.P <- as.numeric(subset$Global_active_power,na.rm=TRUE)
	datetime<-as.POSIXct(paste(subset$Date, subset$Time), format="%d/%m/%Y %H:%M:%S")
	png("plot2.png", width=480, height=480)
	 plot(G.A.P~datetime,main="Global Active Power",type="l",ylab="Global Active Power(kw)",xlab="Days")
	dev.off()
	

}