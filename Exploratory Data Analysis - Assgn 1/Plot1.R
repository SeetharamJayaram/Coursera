
##Get File data into a dataset##
dataSet <- "household_power_consumption.txt"

##Read the data from dataset to a table##
data1 <- read.table(dataSet, header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")

##Get the datasubset as per our requirement based on dates##
dataReq <- subset(data1,Date %in% c("1/2/2007","2/2/2007"))

##Get the column which need to be plotted into a variable##
dataToPlotAP <- as.numeric(dataReq$Global_active_power)

##Create a png file##
png("Plot1.png",width = 480, height = 480)

##Create a histogram which will be stored in the above png file##
hist(dataToPlotAP , col= "red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()