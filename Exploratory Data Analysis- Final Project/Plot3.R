##Exploratory Data Analysis - Project 2
##Question 3
##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
##Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

##This R code will show the total emission from each source sepeartely for the different years and will help us to determine 
##the contribution of each source towards total emission during each year.

##Below code read the data from the files and store it in 2 different datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

## Below code will take the values only for the Baltimore City, Maryland represented by FIPS = 24510 

dataBalti <- NEI[NEI$fips=="24510", ]


## Take the sum of emissions by type and year using below code and store it in variable

sumByYearType <- aggregate(Emissions ~ year + type, dataBalti, sum)


## Plot to show the contribution of each type of source towards total emission for each year in Baltimore City.

png("plot3.png", width=640, height=480)
plot <- ggplot(sumByYearType, aes(year, Emissions, color = type))
plot <- plot + geom_line() +   xlab("Year") +   ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions in Baltimore City, Maryland - Different Years')
print(plot)
dev.off()
