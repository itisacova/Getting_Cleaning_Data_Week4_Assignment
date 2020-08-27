# Dataset Information: 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Attribute information: 

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

# “Run_analysis.R” information:

The dataset for this assignment was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The R script documents the following activities: 
  a.	Merging of the training and the test sets to create one data set.
  b.	Extraction of only the measurements on the mean and standard deviation for each measurement.
  c.	Use of descriptive activity names to name the activities in the data set
  d.	Appropriately labeling the data set with descriptive variable names.
  e.	Creation of a second, independent tidy data set with the average of each variable for each activity and each subject.

Detailed steps undertaken for each activity: 

MERGING OF THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET.

The following files were imported:
- 'features.txt'
- 'activity_labels.txt'
- 'subject_train.txt'
- 'x_train.txt'
- 'y_train.txt'
- 'subject_test.txt'
- 'x_test.txt'
- 'y_test.txt'

Column names were assigned to each file at import. The 3 “_test.txt” files were merged into “testDataset” and the 3 “_train.txt” files were merged into “trainDataset”. 
These 2 newly formed files were subsequently merged into one “MergedDataset”, on which the next analysis was performed. 

EXTRACTION OF ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT.
A logical vector was created to identify TRUE values for the ID, mean and stdev columns. “MergedDataset” was subsetted to keep the relevant columns (with prior TRUE values). 

USE OF DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET.
“NewMergedDataset” was merged with “activity_labels.txt” and values from “activityID” column were replaced with values from “activityType”. Susequently, the “activityType” column was delete for a clean dataset.  

APPROPRIATELY LABELING THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES.
“Gsub” function was applied to rename the abbreviated label in the “NewMergedDataset” into descriptive variable names. 

CREATION OF A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT.
A new table containing the average for each variable by activity and subject was created.

