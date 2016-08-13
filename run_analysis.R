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

#unzip the file overwriting the files to ensure that any modifications are lost
unzip(datafile, overwrite = TRUE)