##Exploratory Data Analysis - Project 2
##Question 4
##Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?


##This R code will show the total emissions by coal related sources over different years.

library(ggplot2)

## The below code read the data from the file and store it 2 different datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Need to get the Source Code from SCC dataset to detrmine the source and hence the below code will merge the 2 datasets and assign it to a different dataset

NEISCC <- merge(NEI, SCC, by="SCC")


##From the merged data set, the below code will seperate only the sources which are coal related.

coalSource <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
dataCoalSource <- NEISCC[coalSource,]


## Take the sum of emissions by year for the different coal sources using below code and store it in variable

sumByYearCoal <- aggregate(Emissions ~ year, dataCoalSource , sum)


## Plot to show differences in emission rates of coal combustion-related sources over different years


png("plot4.png", width=640, height=480)
plot <- ggplot(sumByYearCoal, aes(factor(year), Emissions))
plot <- plot + geom_bar(stat="identity") +   xlab("Year") +  ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions From Coal sources - Different Years')
print(plot)
dev.off()
