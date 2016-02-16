##Download and unzip the file##

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

##Get the list of available files##

path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files


## Read data from different files into variables ##

dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

## Do data concatenation ##

dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

## Give variable names ##

names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

## Combine to get a combined dataframe##

combinedData<-cbind(dataSubject, dataActivity)
Datafile <- Data <- cbind(dataFeatures, combinedData)

## As per requirement subset the data based on measures of mean and standard deviation##

subsetFeaturesNames <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
selectedDataNames <- c(as.character(subsetFeaturesNames), "subject", "activity" )
Datafile <- subset(Datafile,select = selectedDataNames)
str(Datafile)

## Label the dataset names##

names(Datafile) <- gsub("^t", "time", names(Datafile))
names(Datafile)<-gsub("^f", "frequency", names(Datafile))
names(Datafile)<-gsub("Acc", "Accelerometer", names(Datafile))
names(Datafile)<-gsub("Gyro", "Gyroscope", names(Datafile))
names(Datafile)<-gsub("Mag", "Magnitude", names(Datafile))
names(Datafile)<-gsub("BodyBody", "Body", names(Datafile))
names(Datafile)

##Create the final independent tidy data set##       

Datafile2 <- aggregate(. ~subject + activity, Datafile, mean)
Datafile2 <- Datafile2[order(Datafile2$subject,Datafile2$activity),]
write.table(Datafile2, file = "tidydata.txt",row.name=FALSE)
