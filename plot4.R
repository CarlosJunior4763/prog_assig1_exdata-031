## scripts for 1st project in Exploratory Data Analysis
##
## Generating Plot 4

setwd("~/ProgAssig1_exdata")

##      load data 
load('hpcDays_data.Rda')

##      create the grid
par(mfrow=c(2,2))
         
##      make Plot #1
plot(hpcDays$timestamp,hpcDays$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##      make Plot #2
plot(hpcDays$timestamp,hpcDays$Voltage, type="l", xlab="datetime", ylab="Voltage")
        
##      make Plot #3
plot(hpcDays$timestamp,hpcDays$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpcDays$timestamp,hpcDays$Sub_metering_2,col="red")
lines(hpcDays$timestamp,hpcDays$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
        
##      make Plot #4
plot(hpcDays$timestamp,hpcDays$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        
#       create the output
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("plot4.png saved in", getwd())





