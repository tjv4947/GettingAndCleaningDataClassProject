#Getting and Cleaning Data: #
##Course Project README file ##

###   * R Script File for processing raw smart phone data* ###

>>   Assumes that the zip file has been downloaded and expanded from:
>>>   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

>>   Script assumes that it has been copied to same disk as the data files and the R working 
>>   directory has been set to main location of the files

>>   The code is divided into sections to read data from disk, manipulate the data, merge and 
>>     aggregate the data as well as write it out to a file.




>   *Note*:  Many of the steps create their own data frames to allow for debugging and analysis.
          They could be consolodated, but are left here for documentation, clarity and
          possible additional reporting 




## Processing steps

##


> *subjectID*:
>>  Identifier for participant in study.  Values range from 1 - 30.

> *activityName*:
>>  Identifier for participant in study.  Values range processed from the original based on activityID.  This column was removed from tidy dataset as it is not needed.


>> *Data Columns*:
>>  The original raw data has 561 columns.  We are interested in only the data columns which are >> >>  either mean or std columns.  The other columns were removed from data frame before aggregated 
>>  and written to the tidy dataset.  See the code book for the complete column list of the tidy 
>>  dataset
___

> Examples from Raw data:


colSums(table(mergeData$subjectID, mergeData$activityName))



table(mergeData$subjectID, mergeData$activityName)


---




