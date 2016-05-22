##Exploratory Data Analysis - Project 2
##Question 5
##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

##This R code will show the total emissions by motor vehicle sources in Baltimore City over the years.

library(ggplot2)


## The below code read the data from the file and store it 2 different datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Below code will take the values only for the Baltimore City, Maryland represented by FIPS = 24510 and for the source type ON-ROAD which will give us 
## total emissions from motor vehicle sources in Baltimore City over the years.

dataBalti <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]


## Take the sum of emissions type and year wise using below code and store it in variable

sumByYear <- aggregate(Emissions ~ year, dataBalti , sum)


## Plot to show the the total emissions from motor vehicle sources in Baltimore City over the years.

png("plot5.png", width=640, height=480)
plot <- ggplot(sumByYear, aes(factor(year), Emissions))
plot <- plot + geom_bar(stat="identity") +  xlab("Year") +  ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from Motor vehicle Soucres in Baltimore City- Different Years')
print(plot)
dev.off()