## scripts for 1st project in Exploratory Data Analysis
##
## Generating Plot 2

setwd("~/ProgAssig1_exdata")

##      load data 
load('hpcDays_data.Rda')

##      make Plot #2
par(mfrow=c(1,1))

plot(hpcDays$timestamp,hpcDays$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)

#       create the output
dev.off()
cat("plot2.png saved in", getwd())

        
