##Get File data into a dataset##
dataSet <- "household_power_consumption.txt"

##Read the data from dataset to a table##
data1 <- read.table(dataSet, header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")

##Get the datasubset as per our requirement based on dates##
dataReq <- subset(data1,Date %in% c("1/2/2007","2/2/2007"))

##Get the required time from the Date and Time Columns which is required for X Axis##
dataTime <- strptime(paste(dataReq$Date,dataReq$Time,sep= " "),"%d/%m/%Y %H:%M:%S")


##Get the column values which need to be plotted into 3 variables##
subMeter1 <- as.numeric(dataReq$Sub_metering_1)
subMeter2 <- as.numeric(dataReq$Sub_metering_2)
subMeter3 <- as.numeric(dataReq$Sub_metering_3)


##Create a png file##
png("Plot3.png",width = 480, height = 480)


##Create a plot which will be stored in the above png file##
plot(dataTime,subMeter1, type="l", xlab = "" , ylab="Energy Submetering")

##Show 2 variables using function lines##
lines(dataTime,subMeter2, type="l", col = "red")
lines(dataTime,subMeter3, type="l", col = "blue")

##Provide legend at the topright corner##
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2 , col = c("black","red","blue"))

dev.off()