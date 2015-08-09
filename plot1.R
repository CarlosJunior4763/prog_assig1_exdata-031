## scripts for 1st project in Exploratory Data Analysis
##
setwd("~/ProgAssig1_exdata")
##
##      get the file in web

if(!file.exists("exdata-data-household_power_consumption.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        file <- unzip(temp)
        unlink(temp)
}

##      calculate how much memory you need
##      The dataset has 2,075,259 rows and 9 columns.     
##      # rows * # columns * 8 bytes / 2^20
> memory.size()
[1] 551.42

2075259 * 9 * 8 / 2^20
[1] 142.4967

##      read the file
hpcFull <- read.table('household_power_consumption.txt', header=TRUE, sep=";")

##      fix date
hpcFull$Date <- as.Date(hpcFull$Date, format="%d/%m/%Y")

##      Subsetting the data
hpcDays <- hpcFull[(hpcFull$Date=="2007-02-01") | (hpcFull$Date=="2007-02-02"),]

##      fix numeric cols
hpcDays$Global_active_power <- as.numeric(as.character(hpcDays$Global_active_power))
hpcDays$Global_reactive_power <- as.numeric(as.character(hpcDays$Global_reactive_power))
hpcDays$Voltage <- as.numeric(as.character(hpcDays$Voltage))
hpcDays$Sub_metering_1 <- as.numeric(as.character(hpcDays$Sub_metering_1))
hpcDays$Sub_metering_2 <- as.numeric(as.character(hpcDays$Sub_metering_2))
hpcDays$Sub_metering_3 <- as.numeric(as.character(hpcDays$Sub_metering_3))

hpcDays <- transform(hpcDays, timestamp=as.POSIXct(paste(Date, Time)))

##      make Plot #1
par(mfrow=c(1,1))
hist(hpcDays$Global_active_power, 
        main = paste("Global Active Power"), 
        col="red", xlab="Global Active Power (kilowatts)")

##       create the output
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
cat("Plot1.png saved in", getwd())

##       save data created 

save(hpcDays, file = 'hpcDays_data.Rda')
