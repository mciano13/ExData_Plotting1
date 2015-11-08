##Plot 3
householdpower<-read.table("household_power_consumption.txt",skip=66637,nrows=2880,
                           colClasses=c("character","character","numeric","numeric",
                                        "numeric","numeric","numeric","numeric",
                                        "numeric"),sep=";",header=FALSE,na.strings="?")
header<-read.table("household_power_consumption.txt",nrows=1,header=FALSE,sep=";",
                   stringsAsFactors=FALSE)
colnames(householdpower)<-unlist(header)
householdpower$DateTime<-strptime(paste(householdpower$Date,householdpower$Time),
                                  "%d/%m/%Y %H:%M:%S")
png(file="plot3.png")
plot(householdpower$DateTime,householdpower$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(householdpower$DateTime,householdpower$Sub_metering_2,col="red")
lines(householdpower$DateTime,householdpower$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()