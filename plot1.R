plot1 <- function(x= NULL){
  
  if(is.null(x)) x = load()
  
  png("plot1.png", width=480, height=480)
  hist(x$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",
                 ylab="Frequency",  col="red")
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