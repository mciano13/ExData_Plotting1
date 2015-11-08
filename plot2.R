##Plot 2
householdpower<-read.table("household_power_consumption.txt",skip=66637,nrows=2880,
                           colClasses=c("character","character","numeric","numeric",
                                        "numeric","numeric","numeric","numeric",
                                        "numeric"),sep=";",header=FALSE,na.strings="?")
header<-read.table("household_power_consumption.txt",nrows=1,header=FALSE,sep=";",
                   stringsAsFactors=FALSE)
colnames(householdpower)<-unlist(header)
householdpower$DateTime<-strptime(paste(householdpower$Date,householdpower$Time),
                                  "%d/%m/%Y %H:%M:%S")
png(file="plot2.png")
plot(householdpower$DateTime,householdpower$Global_active_power,type="l",
     ylab ="Global Active Power(kilowatts)",xlab="")
dev.off()