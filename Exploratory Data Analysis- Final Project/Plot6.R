##Exploratory Data Analysis - Project 2
##Question 6
##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").
##Which city has seen greater changes over time in motor vehicle emissions?

##This R code will show the total emissions by motor vehicle sources in Baltimore City and in Los Angeles County, California over the years and help us to 
##compare the motor vehicle emissions in both cities.

library(ggplot2)

## The below code read the data from the file and store it 2 different datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Below code will take the values for the Baltimore City, Maryland represented by FIPS = 24510 and for  Los Angeles County, California represented by FIPS = 06037
##along with the source type ON-ROAD

dataBaltiLA <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

## Take the sum of emissions by year and city  using below code and store it in variable

sumByYearFips <- aggregate(Emissions ~ year + fips, dataBaltiLA, sum)
sumByYearFips$fips[sumByYearFips$fips=="24510"] <- "Baltimore,Maryland"
sumByYearFips$fips[sumByYearFips$fips=="06037"] <- "Los Angeles,California"

## Plot to show the the total emissions from motor vehicle sources in Baltimore City and Los Angeles County

png("plot6.png", width=1040, height=480)
plot <- ggplot(sumByYearFips, aes(factor(year), Emissions))
plot <- plot + facet_grid(. ~ fips)
plot <- plot + geom_bar(stat="identity") + xlab("Year") +  ylab(expression('Total PM'[2.5]*" Emissions")) +
  	  ggtitle('Total Emissions from motor vehicle sources in Baltimore City vs Los Angeles - Different Years')
print(plot)
dev.off()