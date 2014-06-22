##Getting and Cleaning Data: #
###Course Project README file ##

####   * R Script File for processing raw smart phone data* ###

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

*Examples from Raw data*:


_colSums(table(mergeData$subjectID, mergeData$activityName))_

|   LAYING | SITTING | STANDING | WALKING | WALKING_DOWNSTAIRS | WALKING_UPSTAIRS |
|----------|----------|---------|----------|---------|--------------------|-------------------|
| 1944 | 1777 | 1906 | 1722 | 1406 | 1544 |


---

_table(mergeData$subjectID, mergeData$activityName)_

|subjectID |   LAYING | SITTING | STANDING | WALKING | WALKING_DOWNSTAIRS | WALKING_UPSTAIRS |
|----------|----------|---------|----------|---------|--------------------|-------------------|
 |  1 | 50 | 47 |  53 | 95   |  49  |    53 |
 |  2 | 48 | 46 |  54 | 59   |  47  |    48 |
 |  3 | 62 | 52 |  61 | 58   |  49  |    59 |
 |  4 | 54 | 50 |  56 | 60   |  45  |    52 |
 |  5 | 52 | 44 |  56 | 56   |  47  |    47 |
 |  6 | 57 | 55 |  57 | 57   |  48  |    51 |
 |  7 | 52 | 48 |  53 | 57   |  47  |    51 |
 |  8 | 54 | 46 |  54 | 48   |  38  |    41 |
 |  9 | 50 | 50 |  45 | 52   |  42  |    49 |
 |  10 |   58 | 54 |  44 | 53   |  38  |    47 |
 |  11 |   57 | 53 |  47 | 59   |  46  |    54 |
 |  12 |   60 | 51 |  61 | 50   |  46  |    52 |
 |  13 |   62 | 49 |  57 | 57   |  47  |    55 |
 |  14 |   51 | 54 |  60 | 59   |  45  |    54 |
 |  15 |   72 | 59 |  53 | 54   |  42  |    48 |
 |  16 |   70 | 69 |  78 | 51   |  47  |    51 |
 |  17 |   71 | 64 |  78 | 61   |  46  |    48 |
 |  18 |   65 | 57 |  73 | 56   |  55  |    58 |
 |  19 |   83 | 73 |  73 | 52   |  39  |    40 |
 |  20 |   68 | 66 |  73 | 51   |  45  |    51 |
 |  21 |   90 | 85 |  89 | 52   |  45  |    47 |
 |  22 |   72 | 62 |  63 | 46   |  36  |    42 |
 |  23 |   72 | 68 |  68 | 59   |  54  |    51 |
 |  24 |   72 | 68 |  69 | 58   |  55  |    59 |
 |  25 |   73 | 65 |  74 | 74   |  58  |    65 |
 |  26 |   76 | 78 |  74 | 59   |  50  |    55 |
 |  27 |   74 | 70 |  80 | 57   |  44  |    51 |
 |  28 |   80 | 72 |  79 | 54   |  46  |    51 |
 |  29 |   69 | 60 |  65 | 53   |  48  |    49 |
 |  30 |   70 | 62 |  59 | 65   |  62  |    65 |
 

---




