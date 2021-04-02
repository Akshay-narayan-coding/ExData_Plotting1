setwd("D:/Git/datasciencecoursera")
output_data <- data.table::fread(input = "household_power_consumption.txt",na.strings="?")
output_data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
output_data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
output_data <- output_data[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot2.png", width=480, height=480)
plot(x = powerDT[, dateTime],y = powerDT[, Global_active_power],type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()