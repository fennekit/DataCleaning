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
dataColumns <- read.table(paste(readDir, "features.txt"))

trainSet <- read.table(paste(readDir,"train/X_train.txt", sep=""), header=FALSE)
testSet <- read.table(paste(readDir,"test/X_test.txt", sep=""), header=FALSE)

trainLabels <- read.table(paste(readDir,"train/y_train.txt", sep=""), header=FALSE)
testLabels <- read.table(paste(readDir,"test/y_test.txt", sep=""), header=FALSE)