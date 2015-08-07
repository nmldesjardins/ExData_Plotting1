################################################################################
#                                Plot 2                                        #
#                 Exploratory Data Analysis _ Project 1                        #
################################################################################

### Load packages
#install.packages("downloader",dependencies=T)
library(downloader)

################################################################################
#                                Get Data                                      #
################################################################################

# Download and unzip the file
zipUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(zipUrl,dest="exdata-data.zip",mode="wb")
unzip("exdata-data.zip", exdir="./")
setwd("~/")

# Read in the whole file
data<-read.table("household_power_consumption.txt", header=T, sep=";",
                 na.strings="?")


# Convert date variable 
data$Date<-as.Date(data$Date, "%d/%m/%Y")

# Select data from 2007-02-01 and 2007-02-02 only
data<-with(data,data[(Date=="2007-02-01")|(Date=="2007-02-02"),])
attach(data)


################################################################################
#                               Create the Plot                                #
################################################################################

# Create a new formatted time variable
data$date_time<-paste(data$Date,data$Time)
data$time2<-strptime(data$date_time, format="%Y-%m-%d %H:%M:%S")


# Turn on png device and set size
png(filename="Plot 2.png", width=480, height=480)

# Generate the line graph with labels
plot(data$time2, Global_active_power, type="l", ylab="Global Active Power 
     (kilowatts)", xlab="")


# Turn off png device
dev.off()
