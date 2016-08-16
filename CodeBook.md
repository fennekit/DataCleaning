# Code book 

From the original data set the following feature description is taken:

> Feature Selection 
> =================
>
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
> 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
> 
> * tBodyAcc-XYZ
> * tGravityAcc-XYZ
> * tBodyAccJerk-XYZ
> * tBodyGyro-XYZ
> * tBodyGyroJerk-XYZ
> * tBodyAccMag
> * tGravityAccMag
> * tBodyAccJerkMag
> * tBodyGyroMag
> * tBodyGyroJerkMag
> * fBodyAcc-XYZ
> * fBodyAccJerk-XYZ
> * fBodyGyro-XYZ
> * fBodyAccMag
> * fBodyAccJerkMag
> * fBodyGyroMag
> * fBodyGyroJerkMag

The following subset of variables that were estimated from these signals that were used are: 

* mean(): Mean value
* std(): Standard deviation

#Processing of data sets

The raw dataset was filtered to limit the set to the mean and std values using the following regular expression:

```regex
mean\\(\\)|std\\(\\)
```
The resulting columns were made tidy by removing the following characters '-','(' and ')'. The string 'std' and 'mean' were 
replaced by 'Std' and 'Mean'. Finally the substring 'BodyBody' was replaced by 'Body'. This resulted in the following list of variables.

#Variables
The complete list of variables is shown below.
* Subject  id of the subject 
* Activity  measured activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* tBodyAccMeanX
* tBodyAccMeanY
* tBodyAccMeanZ
* tBodyAccStdX
* tBodyAccStdY
* tBodyAccStdZ
* tGravityAccMeanX
* tGravityAccMeanY
* tGravityAccMeanZ
* tGravityAccStdX
* tGravityAccStdY
* tGravityAccStdZ
* tBodyAccJerkMeanX
* tBodyAccJerkMeanY
* tBodyAccJerkMeanZ
* tBodyAccJerkStdX
* tBodyAccJerkStdY
* tBodyAccJerkStdZ
* tBodyGyroMeanX
* tBodyGyroMeanY
* tBodyGyroMeanZ
* tBodyGyroStdX
* tBodyGyroStdY
* tBodyGyroStdZ
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStdX
* tBodyGyroJerkStdY
* tBodyGyroJerkStdZ
* tBodyAccMagMean
* tBodyAccMagStd
* tGravityAccMagMean
* tGravityAccMagStd
* tBodyAccJerkMagMean
* tBodyAccJerkMagStd
* tBodyGyroMagMean
* tBodyGyroMagStd
* tBodyGyroJerkMagMean
* tBodyGyroJerkMagStd
* fBodyAccMeanX
* fBodyAccMeanY
* fBodyAccMeanZ
* fBodyAccStdX
* fBodyAccStdY
* fBodyAccStdZ
* fBodyAccJerkMeanX
* fBodyAccJerkMeanY
* fBodyAccJerkMeanZ
* fBodyAccJerkStdX
* fBodyAccJerkStdY
* fBodyAccJerkStdZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdX
* fBodyGyroStdY
* fBodyGyroStdZ
* fBodyAccMagMean
* fBodyAccMagStd
* fBodyAccJerkMagMean
* fBodyAccJerkMagStd
* fBodyGyroMagMean
* fBodyGyroMagStd
* fBodyGyroJerkMagMean
* fBodyGyroJerkMagStd

 
