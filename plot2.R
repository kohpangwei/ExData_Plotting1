makePlot2 <- function(power) {
  
  with(power, {
    plot(DateTime, 
         Global_active_power, 
         type = "n",
         xlab = "",
         ylab = "Global Active Power (kilowatts)")
    
    lines(DateTime, 
          Global_active_power)
    })
  
  dev.copy(png, file = "plot2.png")
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

makePlot2(getData())