##Plot 4
householdpower<-read.table("household_power_consumption.txt",skip=66637,nrows=2880,
                           colClasses=c("character","character","numeric","numeric",
                                        "numeric","numeric","numeric","numeric",
                                        "numeric"),sep=";",header=FALSE,na.strings="?")
header<-read.table("household_power_consumption.txt",nrows=1,header=FALSE,sep=";",
                   stringsAsFactors=FALSE)
colnames(householdpower)<-unlist(header)
householdpower$DateTime<-strptime(paste(householdpower$Date,householdpower$Time),
                                  "%d/%m/%Y %H:%M:%S")
png(file="plot4.png")
par(mfcol=c(2,2))
plot(householdpower$DateTime,householdpower$Global_active_power,type="l",
     ylab ="Global Active Power",xlab="")
plot(householdpower$DateTime,householdpower$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(householdpower$DateTime,householdpower$Sub_metering_2,col="red")
lines(householdpower$DateTime,householdpower$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(householdpower$DateTime,householdpower$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(householdpower$DateTime,householdpower$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()