# Input UCI HAR Dataset was downloaded from:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# This run_analysis.R script will perform the follow tasks: 
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive variable names.
# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

setwd("~/R/Getting_Cleaning_Data_Week4_Assignment")

### 1. Merge the training and the test sets to create one data set.

# Import training data and label the columns

features <- read.table('~/R/UCI HAR Dataset/features.txt', header = FALSE)

activityLabels <- read.table('~/R/UCI HAR Dataset/activity_labels.txt', header = FALSE)
colnames(activityLabels) <- c("activityId","activityType")

subjectTrain <- read.table('~/R/UCI HAR Dataset/train/subject_train.txt', header = FALSE) 
colnames(subjectTrain) <- "subjectId"

xTrain <- read.table('~/R/UCI HAR Dataset/train/x_train.txt', header = FALSE) 
colnames(xTrain) <- features[,2]

yTrain <- read.table('~/R/UCI HAR Dataset/train/y_train.txt', header = FALSE) 
colnames(yTrain) <- "activityId"

# Merge datasets into a complete training dataset
trainingDataset = cbind(yTrain, subjectTrain, xTrain)

# Import test data and label columns 

subjectTest <- read.table('~/R/UCI HAR Dataset/test/subject_test.txt', header = FALSE); 
colnames(subjectTest) <- "subjectId"

xTest <- read.table('~/R/UCI HAR Dataset/test/x_test.txt', header = FALSE) 
colnames(xTest) <-   features[,2]

yTest <- read.table('~/R/UCI HAR Dataset/test/y_test.txt', header = FALSE) 
colnames(yTest) <- "activityId"

# Merge datasets into a complete test dataset
testDataset = cbind(yTest, subjectTest, xTest)

# Merge the Training and Test datasets into one dataset
MergedDataset = rbind(trainingDataset, testDataset)

## 2. 2. Extract only the measurements on the mean and standard deviation for each measurement.
vector <- (grepl("activity..", colnames(MergedDataset)) | 
                   grepl("subject..", colnames(MergedDataset)) | 
                   grepl("-mean..", colnames(MergedDataset)) & !grepl("-meanFreq..", colnames(MergedDataset)) & !grepl("mean..-", colnames(MergedDataset)) | 
                   grepl("-std..", colnames(MergedDataset)) & !grepl("-std()..-", colnames(MergedDataset)))


NewMergedDataset <- MergedDataset[vector == TRUE]

## 3. Use descriptive activity names to name the activities in the data set

NewMergedDataset <- merge(NewMergedDataset, activityLabels, by='activityId', all.x = TRUE)
NewMergedDataset$activityId <- activityLabels[,2][match(NewMergedDataset$activityId, activityLabels[,1])] 

## 4. Appropriately label the data set with descriptive variable names.

col <- colnames(NewMergedDataset)

for (i in 1:length(col))
{
  col[i] <- gsub("^(t)", "Time", col[i])
  col[i] <- gsub("^(f)", "Freq", col[i])
  col[i] <- gsub("-mean", "Mean", col[i])
  col[i] <- gsub("-std", "StdDev", col[i])
  col[i] <- gsub("Mag", "Magnitude", col[i])
  col[i] <- gsub("([Bb]ody[Bb]ody | [Bb]ody)", "Body", col[i])
}
colnames(NewMergedDataset) <- col

# Remove ActivityType column

NewMergedDataset <- NewMergedDataset[,names(NewMergedDataset) != 'activityType']

## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
TidyDataset <- aggregate(NewMergedDataset[,names(NewMergedDataset) 
                                    != c('activityId','subjectId')],by = list
                      (activityId = NewMergedDataset$activityId,
                        subjectId = NewMergedDataset$subjectId), mean)

# Export TidyDataset file
write.table(TidyDataset, "./FinalTidyDataset", row.name = FALSE)
