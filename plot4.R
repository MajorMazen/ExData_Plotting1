plot4 <- function(x= NULL){
  
  if(is.null(x)) x = load()
  
  png("plot4.png", width=480, height=480)
  par(mfrow= c(2,2))
  #1
  plot(x$Time, x$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
  #2
  plot(x$Time, x$Voltage, type= "l", col="black", xlab= "datetime", ylab= "Voltage")
  #3
  plot(x$Time, x$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
  lines(x$Time, x$Sub_metering_2, col="red")
  lines(x$Time, x$Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)
  #4
  plot(x$Time, x$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")

  dev.off()
}

load <- function(){
  x= read.table("household_power_consumption.txt", header = T, sep= ";", colClasses=c("character", "character", 
                                                                                      rep("numeric",7)),  na="?")
  
  x$Time= strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
  x$Date= as.Date(x$Date, "%d/%m/%Y")
  
  dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  x= x[x$Date %in% dates,]
}