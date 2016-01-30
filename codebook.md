# Getting and Cleaning Data Project Codebook


This project manipulates data sets obtained from the UCI Machine Learning Repository at the following url: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Full details on the data can be found in the README.txt and features_info.txt files. To summarize, subjects wearing smartphones were asked to perform 6 activities. The phone's accelerometer and gyroscope captured data while the tasks were being performed. Statistical and other computational procedures were performed on the raw data, and the results were stored in the X_train.txt and X_test.txt files.


## The Project


The script run_analysis.R produces two data sets (merged1 and samsung).

The X_train.txt set is combined with its subject and activity identifier values (from subject_train.txt and y_train.txt). Variable names are attached to the quantitative variables using the features.txt file. The same thing is done with the X_test.txt set. The two sets are then joined.

To produce the first requested data set, the variables from features.txt involving mean() and std() are extracted.

## The variables

The set merged1 contains the following variables.


subject: a number 1-30 identifying the subject performing the activity, extracted from subject_train.txt and subject_test.txt. 
	
activity: the name of the activity performed, extracted from y_train.txt and y_test.txt files, and renamed using the coding (from the activity_labels.txt file) (1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS, 4=SITTING, 5=STANDING, 6=LAYING)

### Quantitative Variables (66 total)

#### Regarding the quantitative variable names:

(***Note to peer reviewer: Based upon forum discussion, with mentor input, long descriptive names were actually encouraged.) 

The variables with the "frequency" prefix were originally obtained by applying a fast Fourier Transform to time-domain measurements.

The timeBodyAcc and timeGravityAcc values represent the acceleration measurements based on the accelerometer data (in 3 axes), while timeBodyGyro is the angular velocity measurement from the gyroscope. The jerk (AccJerk and GyroJerk) measurements were "derived" from the appropriate measurements. Magnitudes of 3-dimensional values were also calculated.

*Note: as mentioned in the source's README.txt file, all variables were normalized to lie in the range [-1,1]. (The original units were 'g's (~9.8 m/s^2) for acceleration and radians/sec for the gyroscope's angular velocity measurements.) 

#### Variable list

timeBodyAccMeanXaxis (With corresponding Yaxis and Zaxis variables for all axial measurements)  
timeBodyAccStandardDeviationXaxis  
timeGravityAccMeanXaxis  
timeGravityAccStandardDeviationXaxis  
timeBodyAccJerkMeanXaxis  
timeBodyAccJerkStandardDeviationXaxis  
timeBodyGyroMeanXaxis  
timeBodyGyroStandardDeviationXaxis  
timeBodyGyroJerkMeanXaxis  
timeBodyGyroJerkStandardDeviationXaxis  
timeBodyAccMagnitudeMean  
timeBodyAccMagnitudeStandardDeviation  
timeGravityAccMagnitudeMean  
timeGravityAccMagnitudeStandardDeviation  
timeBodyAccJerkMagnitudeMean  
timeBodyAccJerkMagnitudeStandardDeviation  
timeBodyGyroMagnitudeMean  
timeBodyGyroMagnitudeStandardDeviation  
timeBodyGyroJerkMagnitudeMean  
timeBodyGyroJerkMagnitudeStandardDeviation  
frequencyBodyAccMeanXaxis  
frequencyBodyAccStandardDeviationXaxis  
frequencyBodyAccJerkMeanXaxis  
frequencyBodyAccJerkStandardDeviationXaxis  
frequencyBodyGyroMeanXaxis  
frequencyBodyGyroStandardDeviationXaxis  
frequencyBodyAccMagnitudeMean  
frequencyBodyAccMagnitudeStandardDeviation  
frequencyBodyAccJerkMagnitudeMean  
frequencyBodyAccJerkMagnitudeStandardDeviation  
frequencyBodyGyroMagnitudeMean  
frequencyBodyGyroMagnitudeStandardDeviation  
frequencyBodyGyroJerkMagnitudeMean  
frequencyBodyGyroJerkMagnitudeStandardDeviation  





## Data set 2: Averaging by subject and activity

The second data set, samsung, is obtained by calculating the mean of all the selected quantitative variables, grouped by subject ID and activity. The quantitative variable names now have "Mean" attached to their ends as they now represent an average of all of the values obtained when a subject performed a certain activity.