library(data.table)
EPC <- fread('household_power_consumption.txt', skip="1/2/2007", nrows=2880, verbose=TRUE)
HNames <- fread('household_power_consumption.txt', header = TRUE, nrows = 0)
EPC$V1 <- as.IDate(EPC$V1, format="%d/%m/%Y")
EPC$V2 <- as.ITime(EPC$V2, format="%H:%M:%S")
EPC$DateTime <- as.POSIXct(EPC$V1) + EPC$V2

png("plot2.png");
plot(EPC$DateTime, EPC$V3, type='l', ylab="Global Active Power(kilowatts)", xlab ="")
dev.off();

