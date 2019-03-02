# url to zip file with raw data, unzip and download
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
tempdata <- tempfile()
download.file(url, tempdata)

# read the file, and insert it into a table
data <- read.csv(unzip(tempdata), sep=";", header=TRUE, dec='.', stringsAsFactors=FALSE)

# updating column names, specifying classes, converting date and time from variables to classes
colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c(rep("character",2), rep("numeric",7) )
df$date = as.Date(df$date, format="%d/%m/%Y")
strptime(data$Time,format="%H:%M:%S")

# filtering on dates
df = df[df$date == as.Date("2007-02-01")  | df$date==as.Date("2007-02-02"),]

# making a plot2 of GlobalActivePower
png(filename="plot2.png", width=480, height=480, units="px")
plot(df$globalActivePower,type="l", xaxt='n',xlab="",ylab="Global Active Power (kilowatts)")
axis(1,c(0,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()