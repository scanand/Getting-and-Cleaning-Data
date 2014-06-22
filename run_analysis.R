#Read all files from the current directory
#this is assuming all files are present in the current directory
#Subject ids
subject_test <- read.table("subject_test.txt")
#associated activities
y_test <- read.table("y_test.txt")
#actual test data for observations
x_test <- read.table("X_test.txt")

# read all subjects, activities and actual train data for observations
subject_train <- read.table("subject_train.txt")
y_train <- read.table("y_train.txt")
x_train <- read.table("X_train.txt")

#contatenate columns by subject then activities and then all observations
testdata <- cbind(subject_test, y_test, x_test)
str(testdata)
#concatenate train data columns
traindata <- cbind(subject_train, y_train, x_train)
str(traindata)

# read all features i.e. all types observations related to test and train data
features <- read.table("features.txt")

# clean observation names and keep only alphaNumericals
observationHeadings <- gsub("[^A-Za-z0-9]","",features[,2])
# change to lower case
observationHeadings <- tolower(observationHeadings)

# add all column headings to test data
colnames(testdata) <- c("subjectid","activityid",c(observationHeadings))
# check if all column names are properly assigned
names(testdata)

# add all column headings to train data
colnames(traindata) <- c("subjectid","activityid",c(observationHeadings))
# check if all column names are properly assigned
names(traindata)
# first check column names are identical
identical( names(traindata), names(testdata))

#check structure of both data and find has matching number of observations 
str(testdata) #data.frame':        2947 obs. of  563 variables:
str(traindata) #'data.frame':        7352 obs. of  563 variables:

#check if train or test data has any NA values, in case if data needs any further cleaning
any(is.na(testdata))
any(is.na(traindata))

# merge both data frames on activity id
mergedData <- rbind(traindata, testdata)
str(mergedData) #'data.frame':        10299 obs. of  563 variables:
2947+7352 #check all rows

# Extract columns having mean and Std.Dev in their names
meanStdObservations <- c(grep('(mean|std)',c(observationHeadings),value=TRUE))
extractedMergedData <- subset.data.frame(mergedData,select=c("subjectid","activityid",meanStdObservations))
str(extractedMergedData) #'data.frame':        10299 obs. of  88 variables:

library(reshape2)
#melt data get long listing of all observations and their means 
tidyDataMelted <- melt( extractedMergedData, id=c("subjectid","activityid"),measure.vars=(meanStdObservations))
head(tidyDataMelted, n=2)

# cast the melted data into table subject + features against activities using mean as aggregate function
tidyDataCasted <- dcast(tidyDataMelted, subjectid + variable ~ activityid , mean)
str(tidyDataCasted)

colnames(tidyDataCasted) <- c("subjectid","features","WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
head(tidyDataCasted, n=2)
tail(tidyDataCasted, n=2)

#write data on the csv
write.table(tidyDataCasted,"tidydata.txt",row.names=FALSE)



