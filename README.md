Course Project for Getting and Cleaning Data Course.

Script: run_analysis.R

Description:

The script assumes that the data set provided by the course is located at the same directory level as itself and the data directory name to be "UCI HAR Dataset".

The script does the following actions:
	a. First read the test data set (x, y and subject).
	b. Then, merge those into one dataset named test.
	c. Repeat above two steps for train data set as well.
	d. Merge test and train dataset.
	e. Read feature names from provided features.txt.
	f. Remove duplicate names and apply as column labels to merged dataset.
	g. Extract only columns containg mean and std deviation.
	h. Read activity labels from provided activity_labels.txt.
	i. Replace activity codes with labels in dataset.
	j. Rename the columns with more appopriate names.
	k. Group the dataset by subject and activity and calculate mean.
	l. Write summary dataset to text file.
	m. Write tidy dataset to text file.



