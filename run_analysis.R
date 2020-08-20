
library(dplyr)

filename <- "Coursera_DS3_Final.zip"

# Checking if archive already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
} 

#Reading in the training data
data_train <- read.table("~/UCI HAR Dataset/train/X_train.txt",header = FALSE)
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
label_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", header = FALSE)

#Reading in the test data
data_test <- read.table("~/UCI HAR Dataset/test/X_test.txt",header = FALSE)
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt",header = FALSE)
label_test <- read.table("~/UCI HAR Dataset/test/y_test.txt",header = FALSE)

#Reading in the activity names 
activities <- read.table("~/UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Reading in the variable names on the recorded data which are in column 2
features <- read.table("~/UCI HAR Dataset/features.txt", header = FALSE)
featureDescription <- features[,2]

#combine the subject IDs from the test & training datasets into one dataset by using row bind function 
#rename the column "Subject" to refer to the ID
data_subject <- rbind(subject_test, subject_train)
names(data_subject) <- c("Subject")

#combine the subject IDs from the test & training datasets into one dataset by using row bind function 
#Renames the column "Activity_Number" to highlight the activity undertaken by subject
data_label <- rbind(label_test, label_train)
names(data_label) <- c("Activity_Number")

#combine the data variables from the test & training datasets into one dataset by using row bind function 
#set the names on the columns to the combined dataset to the imported features descriptions provided
data_x <- rbind(data_test, data_train)
names(data_x) <- featureDescription

#combine all the data using a column bind function
Merged_Data <- cbind(data_subject, data_label, data_x)

#subset the Merged_Data to include all the variables with mean and std while including Subject and Activity_Number
#assign the subsetted Merged_Data to the Tidy_Data dataframe
Tidy_Data <- Merged_Data %>% select(Subject, Activity_Number, contains("mean"), contains("std"))

#rename the activity numbers into the descriptive terms & rename the column
Tidy_Data$Activity_Number <- activities[Tidy_Data$Activity_Number, 2]
names(Tidy_Data)[2] <- "Activity"

#tidy up the names provided to give a clearer explanation of the variable
names(Tidy_Data)<-gsub("-mean()", "Mean_", names(Tidy_Data), ignore.case = TRUE)
names(Tidy_Data)<-gsub("Acc", "Accelerometer_", names(Tidy_Data))
names(Tidy_Data)<-gsub("Gyro", "Gyroscope_", names(Tidy_Data))
names(Tidy_Data)<-gsub("BodyBody", "Body_", names(Tidy_Data))
names(Tidy_Data)<-gsub("Mag", "Magnitude_", names(Tidy_Data))
names(Tidy_Data)<-gsub("^t", "Time_", names(Tidy_Data))
names(Tidy_Data)<-gsub("^f", "Frequency_", names(Tidy_Data))
names(Tidy_Data)<-gsub("-std()", "StandardDeviation_", names(Tidy_Data), ignore.case = TRUE)
names(Tidy_Data)<-gsub("-freq()", "Frequency_", names(Tidy_Data), ignore.case = TRUE)

#Output the data to a Data_Output dataframe
Data_Output <- Tidy_Data %>%  group_by(Subject, Activity) %>%  summarise_all(mean)
write.table(Data_Output, "Tidy_Data.txt", row.name=FALSE)