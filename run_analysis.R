###CHECK if all the required packages exist
if(!require("data.table")){
	install.packages("data.table")	
}
if (!require("reshape2")) {
  install.packages("reshape2")
}

###LOAD all the packages
library(data.table)
library(reshape2)

###CHECK that you are in the correct directory
if(!file.exists("./UCI HAR Dataset/test")){
    stop("Please check that you are in the correct directory 'UCI HAR Dataset'")
}

if(!file.exists("./UCI HAR Dataset/train")){
    stop("Please check that you are in the correct directory 'UCI HAR Dataset'")
}

###Loading all the files into memory
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

###Assign column names to the 1st set of tables
names(xTest) <- features
names(xTrain) <- features

###Before assigning column names to the 2nd set we add a new column with activity labels 
yTest[,2] <- activityLabels[yTest[,1],][,2]
yTrain[,2] <- activityLabels[yTrain[,1],][,2]

###Assign column names to the 2nd set of tables
names(yTest)  <- c("Activity_ID", "Activity_Label")
names(yTrain) <- c("Activity_ID", "Activity_Label")

###Assign column names to the 3rd set of tables
names(subjectTest) = "subject"
names(subjectTrain) = "subject"

###We are only interested in the mean and standard deviation features 
xTest <- xTest[, grep("mean|std", features)]
xTrain <- xTrain[, grep("mean|std", features)]

###Bind all the tables together, first by columns and then by rows
testData <- cbind(subjectTest, yTest, xTest)
trainData <- cbind(subjectTrain, yTrain, xTrain)
tidyData <- rbind(testData, trainData)

###Take the wide format and melt it down for further processing
idColumnNames <- c("subject", "Activity_ID", "Activity_Label")
dataColumnNames <- setdiff(colnames(tidyData), idColumnNames)
meltedData <- melt(tidyData, id = idColumnNames, measure.vars = dataColumnNames)

##Find the average of each variable for each subject and activity
summarisedTidyData  <- dcast(meltedData, subject + Activity_Label ~ variable, mean)

##write it out to a file without the row names
write.table(summarisedTidyData, file = "./tidyData.txt", row.names=FALSE)
