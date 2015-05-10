makePlot1 <- function(power) {
  with(power, {
    plot(DateTime, 
         Global_active_power, 
         type = "n",
         xlab = "",
         ylab = "Global Active Power")
    
    lines(DateTime, 
          Global_active_power)
  })
}


makePlot2 <- function(power) {
  with(power, {
    plot(DateTime, 
         Voltage, 
         type = "n",
         xlab = "datetime",
         ylab = "Voltage")
    
    lines(DateTime, 
          Voltage)
  })
}


makePlot3 <- function(power) {
  with(power, {
    plot(DateTime, 
         Sub_metering_1, 
         type = "n",
         xlab = "",
         ylab = "Energy sub metering")
    
    lines(DateTime, 
          Sub_metering_1,
          col = "black")
    
    lines(DateTime, 
          Sub_metering_2,
          col = "red")
    
    lines(DateTime, 
          Sub_metering_3,
          col = "blue")
    
    legend("topleft",
           lty = 1,
           cex = 1,
           bty = "n",
           col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  })
}


makePlot4 <- function(power) {
  
  with(power, {
    plot(DateTime, 
         Global_reactive_power, 
         type = "n",
         xlab = "datetime",
         ylab = "Global_reactive_power")
    
    lines(DateTime, 
          Global_reactive_power,
          col = "black")    
  })
  
}


getData <- function() {
  
  filename <- "household_power_consumption.txt"
  power <- read.table(filename, header=TRUE, sep=";", na.strings="?")
  library(dplyr)
  
  power <- power %>% 
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>% 
    mutate(DateTime = as.POSIXct(
      strptime(paste(Date, Time), 
               format = "%d/%m/%Y %H:%M:%S"))) 
  
  
  power
  
}


power <- getData()

png(file = "plot4.png")
par(mfrow = c(2,2))
makePlot1(power)
makePlot2(power)
makePlot3(power)
makePlot4(power)
dev.off()

