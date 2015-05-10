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
    
    legend("topright",
           lty = 1,
           col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  })
  
  dev.copy(png, file = "plot3.png")
  dev.off()
  
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

makePlot3(getData())