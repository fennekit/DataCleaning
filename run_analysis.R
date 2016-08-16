library(dplyr)
library(reshape2)

# ensure data dir exist
if (!file.exists("data")) {
    dir.create("data")
}
# get datset if it does not exist yet
datafile <- "./data/dataset.zip"
if (!file.exists(datafile)) {
    url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url, datafile, method="curl")
}
extractDir <- "zipdata"
#unzip the file overwriting the files to ensure that any modifications are lost
unzip(datafile, overwrite = TRUE, exdir = extractDir)

readDir <- paste(extractDir, "/UCI HAR Dataset/", sep="")

#read datacolumns and determine the ones we are interested in (std and mean)
dataColumns <- read.table(paste(readDir, "features.txt", sep=""), header = FALSE)
meanAndStdColumns <- grep("mean\\(\\)|std\\(\\)",dataColumns[,2])

#create nice names
meanAndStdColumns.Names <- as.character(dataColumns[,2][meanAndStdColumns])
meanAndStdColumns.Names <- sub("-mean\\(\\)", "Mean", meanAndStdColumns.Names)
meanAndStdColumns.Names <- sub("-std\\(\\)", "Std", meanAndStdColumns.Names)
meanAndStdColumns.Names <- sub("\\(\\)", "", meanAndStdColumns.Names)
meanAndStdColumns.Names <- sub("-", "", meanAndStdColumns.Names)
meanAndStdColumns.Names <- sub("BodyBody", "Body", meanAndStdColumns.Names)

#read the train and test set
trainSet <- read.table(paste(readDir,"train/X_train.txt", sep=""), header=FALSE)[meanAndStdColumns]
testSet <- read.table(paste(readDir,"test/X_test.txt", sep=""), header=FALSE)[meanAndStdColumns]

#read activity labels
activityLabel <- read.table(paste(readDir,"activity_labels.txt", sep=""))

#read the labels for the training set and match them with names
trainLabels <- read.table(paste(readDir,"train/y_train.txt", sep=""), header=FALSE)
trainLabels <- inner_join(trainLabels, activityLabel, by=c("V1","V1"))
names(trainLabels) <- c("Id", "Activity")

#read the labels for the test and match them with names
testLabels <- read.table(paste(readDir,"test/y_test.txt", sep=""), header=FALSE)
testLabels <- inner_join(testLabels, activityLabel, by=c("V1","V1"))
names(testLabels) <- c("Id", "Activity")

#read the subject data
trainSubject <-read.table(paste(readDir,"train/subject_train.txt", sep=""), header=FALSE)
testSubject <-read.table(paste(readDir,"test/subject_test.txt", sep=""), header=FALSE)

#create a total set for the training data
train <- cbind(trainSubject, trainLabels$Activity, trainSet)
names(train) <- c("Subject", "Activity", meanAndStdColumns.Names)

#create a total set for the test data
test <- cbind(testSubject, testLabels$Activity, testSet)
names(test) <- c("Subject", "Activity", meanAndStdColumns.Names)

#create a total
total <- rbind(train, test)

#create summarized
summarizedTotal <- total %>% group_by(Subject,Activity) %>% summarize_each(funs(mean))
#names(summarizedTotal) <- c(names(summarizedTotal)[1:2], paste("MeanOf", 
#                                    names(summarizedTotal[-(1:2)]), sep=""))
                         
write.table(summarizedTotal, "summary.txt", row.name=FALSE)

normalizedSummarizedTotal<-melt(summarizedTotal, c("Subject", "Activity"), 
                                variable.name="VariableName", value.name = "Value")
write.table(normalizedSummarizedTotal, "normalizedSummary.txt", row.name=FALSE)
