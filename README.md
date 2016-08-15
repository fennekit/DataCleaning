# README

The file [run_analysis.R](https://github.com/fennekit/DataCleaning/blob/master/run_analysis.R) downloads the required data from the 
[here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The script performs the following actions:
1. The script stores the zip file in the *./data/* directory. If the directory does not exist the script creates the directory.
2. Once the file is downloaded the zip-file is unzipped in the *./zipdata/* directory.
3. From the file *features.txt* all the available columns are loaded and the columns containing **std()** or **mean()** are selected
4. From these selected columns 'nice' names are created.
5. The training dataset and the test dataset are loaded and only the columns we are interested in are stored
6. The test and training activity labels are loaded and joined with activilable texts to create 'nice' names
7. The test and training subject data is loaded
8. All the columns related to train and test combined to result in two data sets (for train and test)
9. Finally these two datasets are combined into one large dataset.
10. From this combined dataset, for each activity, subject and variable the mean value is calculated
11. This result is stored in the file **summary.txt**



