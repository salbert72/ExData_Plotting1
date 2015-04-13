ibrary(data.table)
EPC <- fread('household_power_consumption.txt', skip="1/2/2007", nrows=2880, verbose=TRUE)
HNames <- read.csv('household_power_consumption.txt', header = TRUE, nrows = 0)
setnames(EPC, HNames)
EPC$V1 <- as.IDate(EPC$V1, format="%d/%m/%Y")
EPC$V2 <- as.ITime(EPC$V2, format="%H:%M:%S")
EPC$DateTime <- as.POSIXct(EPC$V1) + EPC$V2

png('plot3.png')
plot(EPC$DateTime,EPC$V7, type='l', col = "black" , ylab = "Energy sub metering", xlab = "")
lines(EPC$DateTime,EPC$V8, type='l', col = "red",  ylab = "")
lines(EPC$DateTime,EPC$V9, type='l', col = "blue", ylab = "")
legend("topright",lty = c(1,1,1), col = c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()

