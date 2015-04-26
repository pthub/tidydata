# Getting and Cleaning Course Data Project

## Project Overview
The purpose of this project is to clean a data set according to the tidy data principles.

## Dataset
The dataset is linked to wearable computing and links to the description and dataset are given below

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Script
There is a "run_analysis.R" script in this directory that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set file with the average of each variable for each activity and each subject.

## Script Output

The output of the script is a file called "tidyData.txt"

## Setup

Before running the R script on your local PC please do the following

1. Clone this repo.
2. Unzip the UCI HAR Dataset.zip file
3. You should have a folder containing the "run_analysis.R" file and a subfolder called "UCI HAR Dataset" (containing all the data files)


## Running the script

1. Open R
2. set working directory to the folder containing the "run_analysis.R" file using the setwd command.
3. Run the script using source("run_analysis.R") command
4. The script should create the "tidyData.txt" file.
