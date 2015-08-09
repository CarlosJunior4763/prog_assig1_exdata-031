## scripts for 1st project in Exploratory Data Analysis
##
## Generating Plot 3

setwd("~/ProgAssig1_exdata")

##      load data 
load('hpcDays_data.Rda')

##      make Plot #3
par(mfrow=c(1,1))

plot(hpcDays$timestamp,hpcDays$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpcDays$timestamp,hpcDays$Sub_metering_2,col="red")
lines(hpcDays$timestamp,hpcDays$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

#       create the output
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("plot3.png saved in", getwd())


