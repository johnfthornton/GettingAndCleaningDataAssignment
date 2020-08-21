# GettingAndCleaningDataAssignment

## Coursera - Peer Graded Getting and Cleaning Data Assignment - Aug 2020

This github repository is for the assignment submission for John Thornton for the Coursera course from John Hopkins University called 'Getting and Cleaning Data'. This has a full description on how to perform the analysis on the provided 'Human Activity Recognition Using Smartphones Dataset'.

### Data set

The Data set was downloaded as a zip file from  [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Files

Codebook.md is a codebook that provides infomation about the variables and the raw data set and the processes applied to clean up the data

run_analysis.R downloads the dataset from the provided link and then performs the five steps required as in the assignment specification:

  + Downloads and unzips the files if they arent present
  + Mergers the training and test sets to create one data set
  + Extracts the mean and standard deviation measures from the data
  + Uses descriptive activity names to name the activities in the data set
  + Amends the variable names to give description titles
  + Creates a new tidy data set with the average of each variablel for each activity and each subject
  + Outputs the new tidy data set to "Tidy_Data.txt" 
