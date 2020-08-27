# Getting_Cleaning_Data_Week4_Assignment

This repository contains the documentation and scripts for the Week 4 Assignment of the Coursera Getting & Cleaning Data course. 

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The full description of the data used in this projects: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data source for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The repository contains the following scripts and documentation: 
1.	“Run_analysis.R” script that performed the following: 
  a.	Merged the training and the test sets to create one data set.
  b.	Extracted only the measurements on the mean and standard deviation for each measurement.
  c.	Used descriptive activity names to name the activities in the data set
  d.	Appropriately labeled the data set with descriptive variable names.
  e.	Created a second, independent tidy data set with the average of each variable for each activity and each subject.

2.	“FinalTidyDataset.txt” that provides the output from the Run_analysis.R script

3.	“CodeBook.md” that describes the variables, the data, and transformations performed to clean up the data.
