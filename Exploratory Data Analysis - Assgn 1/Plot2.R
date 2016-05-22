##Get File data into a dataset##
dataSet <- "household_power_consumption.txt"

##Read the data from dataset to a table##
data1 <- read.table(dataSet, header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")

##Get the datasubset as per our requirement based on dates##
dataReq <- subset(data1,Date %in% c("1/2/2007","2/2/2007"))

##Get the required time from the Date and Time Columns which is required for X Axis##
dataTime <- strptime(paste(dataReq$Date,dataReq$Time,sep= " "),"%d/%m/%Y %H:%M:%S")

##Get the column which need to be plotted into a variable##
dataToPlotAP <- as.numeric(dataReq$Global_active_power)

##Create a png file##
png("Plot2.png",width = 480, height = 480)


##Create a plot which will be stored in the above png file##
plot(dataTime,dataToPlotAP, type="l", xlab = "" , ylab="Global Active Power (kilowatts)")

dev.off()