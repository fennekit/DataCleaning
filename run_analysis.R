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
extractDir <- "output"
#unzip the file overwriting the files to ensure that any modifications are lost
unzip(datafile, overwrite = TRUE, exdir = extractDir)

readDir <- paste(extractDir, "/UCI HAR Dataset/", sep="")

trainSet <- read.table(paste(readDir,"train/X_train.txt", sep=""), header=FALSE, sep=" ")
trainLabels <- read.table(paste(readDir,"train/y_train.txt", sep=""), header=FALSE, sep = " ")
testSet <- read.table(paste(readDir,"test/X_test.txt", sep=""), header=FALSE, sep = " ")
testLabels <- read.table(paste(readDir,"test/y_test.txt", sep=""), header=FALSE, sep = " ")