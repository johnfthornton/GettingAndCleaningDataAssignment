---
title: "CodeBook"
author: "JT"
date: "8/21/2020"
output: html_document
---

## CodeBook Summary

The run_analysis.R script performs the data download and preparation of the existing data into the required structure as described in the assignment specification.

### 1. Downloading Data

The data set was downloaded from the web and extracted into a folder called 'UCI HAR Dataset'

### 2. Files Utilised

* data_train <- X_train.txt (7352 rows 561 cols)
    contains the data for the 21 out of 30 subjects for the training component

* subject_train <- subject_train.txt (7352 rows 1 col)
    contains the associated subject ID for the data_train data set
  
* label_train <- y_train.txt (7352 rows 1 col)
    contains the associated activity type for the data_train data set    

* data_test <- X_test.txt (2947 rows 561 cols)
    contains the data for the 9 out of 30 subjects for the test component


* subject_test <- subject_test.txt (2947 rows 1 col)
    contains the associated subject ID for the data_test data set

* label_test <- y_test.txt (2947 rows 1 col)
    contains the associated activity type for the data_test data set   

* activities <- activity_labels.txt (6 rows 2 cols)
    list of the description of activities undertaken during the analysis

* features <- features.txt (561 rows 2 cols)
    The features selected for this database come from the accelerometer and gyroscope       
    3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
    
### 3. Merging Files

* data_subject is created by combining the subject_test and subject_train datasets using the rbind() function
* data_label is created by combining the label_test and label_train datasets using the rbind() function
* data_x is created by combining the data_test and data_train datasets using the rbind() function
* Merged_Data is created by combining the data_subject, data_label, & data_x sets using the c_bind() function.

### 4. Subsetting the Data

* The assignment required the subsetting of the data to include the subject ID, the activity type and all the variables that included a mean and standard deviation metric and then storing this in a Tidy_Data data set.
* Tidy_Data was created by subsetting using the dplyr library and the 'select' function for the required variables.

### 5. Updating the activity types to descriptive terms

* The Tidy_Data set was updated to change the activity_number metric to the descriptive term as provided in the activities table

### 6. Update the labels to use more descriptive terms

* The labels on Tidy_Data were updated to give more descriptive titles. Abbreviations were replaced with appropriate descriptions where possible using the gsub() function. 
* These included:
  - "-mean()"" was mapped to "Mean_"
  - "Acc" was mapped to "Accelerometer_"
  - "Gyro" was mapped to "Gyroscope_"
  - "BodyBody" was mapped to "Body_"
  - "Mag" was mapped to "Magnitude_"
  - lines beginning with "t" were mapped to "Time_"
  - lines beginning with "f" were mapped to "Frequency_"
  - "-std()" was mapped to "StandardDeviation_"
  - "-freq()" was mapped to "Frequency_"
  
### 7. Summarise the data in a final table


* The Tidy_Data table was summarised for each subject & activity for each underlying variable
* This table was output to a Tidy_Data.txt file


