#CodeBook

This document describes the datasource, the various files in the dataset, the script used for the transformation, the steps involved and the output of the script.

##Dataset Overview

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz

Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


##Dataset
The dataset can be downloaded using the link below

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##Files in the dataset

The files of importance are given below

1. README.txt, Self explanatory 
2. features_info.txt, Additional information about the features including the details of the measurements.
2. activity_labels.txt, A description of each activity performed by the volunteers like Walking, Walking Upstairs etc
3. features.txt, A list of all the features measured and derived, as part of the experiments.
4. test/X_test.txt, Each row is a series of measurements corresponding to the list of features
5. train/X_train.txt, Each row is a series of measurements corresponding to the list of features
6. test/y_test.txt, Each row is an activity
7. train/y_train.txt, Each row is an activity
8. test/subject_test.txt, Each row is a subject
9. train/subject_train.txt, Each row is a subject

##Transformation Script

There is a "run_analysis.R" script in this directory that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set file with the average of each variable for each activity and each subject.

##The transformation steps performed in the script (not necessarily in the order mentioned below)

1. Load all the files into data tables.
2. Enrich the "activity" tables with the activity labels
3. Label all the datatables 
4. Merge all the tables by column and row into a tidy dataset containing subject, activity and a list of features.
5. Melt the dataset by ids and measurement variables
6. Create a second independent data table with the average of each variable by subject and activity.
7. Write out the datatable to a file.  

##Script Output

The script creates a "tidyData.txt" file with the subject, activity label and average of each variable.

##Running the script

See the README.md file for more details