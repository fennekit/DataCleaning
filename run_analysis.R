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

#read datacolumns and determine count
dataColumns <- read.table(paste(readDir, "features.txt", sep=""), header = FALSE)
meanAndStdColumns <- grep("mean|std",dataColumns[,2])
meanAndStdColumns.Names <- as.character(dataColumns[,2][meanAndStdColumns])
meanAndStdColumns.Names <- sub("-mean", "Mean", meanAndStdColumns.Names)
meanAndStdColumns.Names <- sub("-std", "Std", meanAndStdColumns.Names)
meanAndStdColumns.Names <- sub("\\(\\)", "", meanAndStdColumns.Names)
meanAndStdColumns.Names <- sub("^t", "Time",meanAndStdColumns.Names)
meanAndStdColumns.Names <- sub("^f", "Frequency",meanAndStdColumns.Names)

trainSet <- read.table(paste(readDir,"train/X_train.txt", sep=""), header=FALSE)[meanAndStdColumns]
testSet <- read.table(paste(readDir,"test/X_test.txt", sep=""), header=FALSE)[meanAndStdColumns]

trainLabels <- read.table(paste(readDir,"train/y_train.txt", sep=""), header=FALSE)
testLabels <- read.table(paste(readDir,"test/y_test.txt", sep=""), header=FALSE)

trainSubject <-read.table(paste(readDir,"train/subject_train.txt", sep=""), header=FALSE)
testSubject <-read.table(paste(readDir,"test/subject_test.txt", sep=""), header=FALSE)

train <- cbind(trainSubject, trainLabels, trainSet)
test <- cbind(testSubject, testLabels, testSet)

total <- rbind(train, test)
names(total) <- c("Subject", "Activity", meanAndStdColumns.Names)