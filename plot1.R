makePlot1 <- function(power) {
    
  hist(power$Global_active_power,
       col = "red",
       main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)")
  
  dev.copy(png, file = "plot1.png")
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


makePlot1(getData())