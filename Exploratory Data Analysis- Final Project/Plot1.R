##Exploratory Data Analysis - Project 2
##Question 1
##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission
##from all sources for each of the years 1999, 2002, 2005, and 2008.

##This R code will show the total emission from all sources for different years and will help us to determine whether emissions decreased over the years in entire US

##Below code read the data from the files and store it 2 different datasets ##

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Take the sum of emissions by year using below code and store it in variable

sumByYear <- aggregate(Emissions ~ year, NEI, sum)

## Plot the sum to detremine whether the emissions decreased over years

png('plot1.png')
barplot(height=sumByYear$Emissions,names.arg=sumByYear$year, xlab="Year", ylab=expression('Total PM'[2.5]*'Emission'),
main=expression('Total PM'[2.5]*' Emissions - Different years'))
dev.off()

