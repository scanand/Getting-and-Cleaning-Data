# Contents</br>
The repository contains </br>

- **README.md** - describes what are the listings of the repository, including comments on submitted tidy data format.</br>

- **Codebook.md** - describes columns of tidy data.  Also describes the activities done on raw data to achieve tidy data results</br>

- **Run_analysis.r** - the R source code, which transforms following files read from current directory. 

-1. 'features.txt': List of all features.</br>
-2. 'activity_labels.txt': Links the class labels with their activity name.</br>
-3. 'train/X_train.txt': Training set.</br>
-4. 'train/y_train.txt': Training labels.</br>
-5. 'test/X_test.txt': Test set.</br>
-6. 'test/y_test.txt': Test labels.</br
</br> 
Further information about code function is in Codebook.md</br>

# Submitted tidy data - WHY this format?
- The tidy data is in long-listing format as per 'tidy-data.pdf' [H. Wickham] where each variable forms a column and each observation forms a row, and in this case we have only observational unit, i.e. mean.
- submitted tidy data [2580 rows * 8 columns] is easier to manage rather than just a long listing.
- **All we need to do is when reader is looking at tidy data, she should find "average of each variable for each activity and each subject"**
- As discussion forums pointed out there  may not be single answer for this assignment.  But different answer as tidy data is relative term
- my tidy data submission is based on

-- 5th Point "Creates a second, independent tidy data set with the average of each variable for each activity and each subject." 

-- https://class.coursera.org/getdata-004/forum/thread?thread_id=219#comment-686

# Structure of tidy data -
I have reshaped the tidy data using cast() into 
**"Subject + Feature [forming rows]"** Vs **"Activity [forming columns]"**.
The tidy data has total 2580 rows and each subject has 86 observations.  So for 30 subjects, total is 30*86 = 2580 rows, and each row has 6 activity values(in columns)

# Further Assumptions On unzipping
I haven not done any unzipping code based on following.
- as submission note clearly says
The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory.
- One of discussion forum points this out
https://class.coursera.org/getdata-004/forum/thread?thread_id=198#comment-690

