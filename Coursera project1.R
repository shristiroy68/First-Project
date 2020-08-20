data1=read.csv(file.choose())
data1
str(data1)
data1$Column1=as.Date(data1$Column1,"%d/%m/%Y")
data1=subset(data1,Column1>=as.Date("2007-02-1") & Column1<=as.Date("2007-2-2"))
data1=data1[complete.cases(data1),]                                        #to remove missing observations

data1$Column1Time=setNames(data1$Column1Time, "DateTime")

data1$Column1Time=as.POSIXct(data$Column1 ,data1$Time)
#constructing plot1

hist(data1$Global_active_power,main = "Global Active Power",xlab = "Global Active Power(kilowatts)",col = "red")
dev.off()

#constructing plot2
plot(data1$Global_active_power,data1$Column1Time,type="l",ylab = "Global Active Power(kilowatts)",xlab="")
dev.copy(png,plot,"plot2.png",width=480,height=480)

#construction of plot3
with(data1{})
legend("topright",col = c("black","red","blue"),lwd = c(1,1,1),c("Sub_metering_1","Sub_metering_2","Sum_metering3"))
dev.copy(png, file="plot3.png", height=480, width=480)


#construction of plot4
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(data1,{plot(data1$Global_active_power,data1$Column1Time,type = "l",ylab = "Voltage(volt)",xlab = "")plot(Sub_metering_1,type="l"
                                                                                                              ,ylab="Global Reactive Power(kilowatts)",xlab="")})










