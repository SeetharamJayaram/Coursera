##Exploratory Data Analysis - Project 2
##Question 2
##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
##Use the base plotting system to make a plot answering this question.

##This R code will show the total emissions from different sources in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008

## The below code read the data from the file and store it variables ##

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## Below code will take the values only for the Baltimore City, Maryland represented by FIPS = 24510

dataBalti <- NEI[NEI$fips=="24510", ]

## Take the sum of emissions by year only for Baltimore City using below code and store it in variable

sumByYear <- aggregate(Emissions ~ year, dataBalti, sum)

## Plot the sum to detremine whether the emissions decreased over years in Baltimore City, Maryland

png('plot2.png')
barplot(height=sumByYear$Emissions,names.arg=sumByYear$year, xlab="Year", ylab=expression('Total PM'[2.5]*'Emission'),
main=expression('Total PM'[2.5]*' Emissions - Different years in Baltimore City, Maryland'))
dev.off()

