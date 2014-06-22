## Project File for getting and cleaning data
##
##   Assumes that the zip file has been downloaded and expanded from:
###   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
###  Script assumes that it has been copied to same disk as the files and the R working directory 
###   has been set to main location of the files
###
###   The code is divided into sections to read data from disk, manipulate the data, merge and 
###     aggregate the data as well as write it out to a file.
###
###
###
###
###   Note:  Many of the steps create their own data frames to allow for debugging and analysis.
###          They could be consolodated, but are left here for documentation, clarity and
###          possible additional reporting 
###
###############


print("Beginning to read data from disk.")
##  N.B. Could add error checking and abort execution if problem with files


### read setup files
    columnNames <- read.table("features.txt", col.names=c("idx","colName"))
    activityLabel <- read.table("activity_labels.txt", col.names=c("idx","activityName"))


## Code for cleaning up raw data to remove unused columns in final tidy data set
##    searches for column names wwhich contain either "mean" or "std" and retains them
    keepColMean <- columnNames[grep("mean", columnNames$colName, ignore.case = TRUE),]
    keepColStd <- columnNames[grep("std", columnNames$colName, ignore.case = TRUE),]
    keepCols <- merge(keepColMean, keepColStd, all=TRUE)


## read test data files
print("     > Reading Test data from disk.")
    yTest <- read.table("./test/Y_test.txt", col.names=c("activityID"), strip.white=TRUE)
    subjectTest <- read.table("./test/subject_test.txt", col.names=c("subjectID"),strip.white=TRUE)

    xTestRaw <- read.table("./test/X_test.txt", col.names=columnNames$colName, strip.white=TRUE)

## read train data files
print("     >> Reading Train data from disk.")
    yTrain <- read.table("./train/Y_train.txt", col.names=c("activityID"), strip.white=TRUE)
    subjectTrain <- read.table("./train/subject_train.txt", col.names=c("subjectID"), strip.white=TRUE)

    xTrainRaw <- read.table("./train/X_train.txt", col.names=columnNames$colName, strip.white=TRUE)

#####
## Start putting together initial datasets

#test data
    mTest1 <- cbind(subjectTest, yTest)
    ## creating column for activity name text field and setting it to NA
    mTest1$activityName <- NA
    # filling column with values
    mTest1$activityName <- activityLabel$activityName[mTest1$activityID]

    xTestClean <- xTestRaw[, keepCols$colName, drop=FALSE]
    mTest2 <- cbind(mTest1, xTestClean)

# train data
    mTrain1 <- cbind(subjectTrain, yTrain)
    ## creating column for activity name text field     mTrain1$activityName <- NA
    # filling column with values
    mTrain1$activityName <- activityLabel$activityName[mTrain1$activityID]

    xTrainClean <- xTrainRaw[, keepCols$colName, drop=FALSE]
    mTrain2 <- cbind(mTrain1, xTrainClean)


print("Merging Test and Train Datasets together ")

    ## section for merging data
    mergeData <- merge(mTest2, mTrain2, all=TRUE)
    
##  delete activityID column from final merged data set which isn't needed in tidy set
    dropCol <- c("activityID")
    mergeData <- mergeData[,!(names(mergeData) %in% dropCol)]


print("Into code section analyzing merged dataset to create new tidy dataset")
    ##  N.B. Aggregating data only from the last data columns, skipping the subjectID 
    ##     and activityName columns
    tidyAggregatedAverageData <- aggregate(mergeData[3:88], list(Activity = mergeData$activityName, Subject = mergeData$subjectID), mean)


print("Writing out new dataset to disk")

#Code to deal with problem with column names are truncated from original
myColNames = c("activityName", "subjectID", as.character(keepCols$colName))   ##"idx", 

## if file exists delete it.  If file is locked by another process the write will fail.
    fn <- "AggregatedAverageData.txt"
    if (file.exists(fn)) file.remove(fn)
    write.table(tidyAggregatedAverageData, file = fn, sep = ",", row.names=FALSE, col.names = myColNames)


print("Finished processing dataset.")

