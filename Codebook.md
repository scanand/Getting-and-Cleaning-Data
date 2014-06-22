The data tidydata.csv is generated using data from Samsung experiments carried out on wearable devices. The experiments have been carried out with a group of 30 volunteers.  The data set has total 2580 rows 
and 8 variables.

The columns(variables) in this tidy data set are
1. subjectid - this signifies the volunteer id, who participated experimentation.
2. features - is a factor variable.  This signifies observation type.  The experimentation recorded various observations of 3-axial linear acceleration and 3-axial angular velocity for various activities(listed below).   This column lists either mean or standard deviation of respective observation.
3. WALKING - Mean of "walking" activity recorded for that feature(observation type) for that particular volunteer.
3. WALKING_UPSTAIRS - Mean of "walking upstairs" activity recorded for that feature(observation type) for that particular volunteer.
4. WALKING_DOWNSTAIRS - Mean of "walking downstairs" activity recorded for that feature(observation type) for that particular volunteer.
5. SITTING - Mean of "sitting" activity recorded for that feature(observation type) for that particular volunteer.
6. STANDING - Mean of "standing" activity recorded for that feature(observation type) for that particular volunteer.
7. LAYING - Mean of "laying" activity recorded for that feature(observation type) for that particular volunteer.

All mean values for the activities are normalized and bounded within [-1,1].

----Data Cleaning Activity:
1. Data was combined from various observations recorded in various files.  Also data was found divided into test and training data. 
2. Specific actions taken on the data
- Read files from the local storage
- read all subjects, activities and actual observations for train and test data set
- concatenate all columns by subject then activities and then all observations for both data sets
- clean all observation names and keep only alphaNumericals
- add all data proper column names 
- merge both data frames 
- extract mean columns having mean and Std.Dev observations
- get the long listing of all observations and their mean or standard deviation value using melt() of reshape2 package.
- 'cast' into a new shape i.e. data frame for subject + features against activities and using mean as an aggregate function
- Write to the csv

