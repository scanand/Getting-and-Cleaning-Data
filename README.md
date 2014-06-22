---- Contents
The repository contains 
1. README.md - describes what are the listings of the repository, including comments on submitted tidy data format.
2. Codebook.md - describes columns of tidy data.  Also describes the activities done on raw data to achieve tidy data results
3. Run_analysis.r - the R source code, which transforms following files read from current directory.  Further information about code function is in Codebook.md
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

---- Tidy Data ----
The tidy data is in long-listing format as per 'tidy-data.pdf' [H. Wickham] where each variable forms a column and each observation forms a row, and in this case we have only observational unit, i.e. mean.

---- Submitted tidy data - WHY this format?
- submitted tidy data [2580 rows * 8 columns] is easier to manage rather than just a long listing.
- All we need to do is when reader is looking at tidy data, she should find "average of each variable for each activity and each subject"
- As discussion forums pointed out there  may not be single answer for this assignment.  But different answer as tidy data is relative term
- my tidy data submission is based on  
1. 5th Point "Creates a second, independent tidy data set with the average of each variable for each activity and each subject. "
2. https://class.coursera.org/getdata-004/forum/thread?thread_id=219#comment-686

---- Structure of tidy data -
I have reshaped the tidy data using cast() into 
*"Subject + Feature [forming rows]"* Vs *"Activity [forming columns]"*.
The tidy data has total 2580 rows and each subject has 86 observations.  So for 30 subjects, total is 30*86 = 2580 rows, and each row has 6 activity values(in columns)

---- Further Assumptions On unzipping
I haven not done any unzipping code based on following.
1. as submission note clearly says
The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory.
2. One of discussion forum points this out
https://class.coursera.org/getdata-004/forum/thread?thread_id=198#comment-690

