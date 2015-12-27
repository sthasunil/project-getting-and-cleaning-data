#Course Project for Getting and Cleaning Data Course.

This repo contains run_analysis.R and CodeBook.md.

##Script: run_analysis.R

Description:

The script assumes that the data set provided by the course is located at the same directory level as itself and the data directory name to be "UCI HAR Dataset".

The script does the following actions:
- First read the test data set (x, y and subject).
- Then, merge those into one dataset named test.
- Repeat above two steps for train data set as well.
- Merge test and train dataset.
- Read feature names from provided features.txt.
- Remove duplicate names and apply as column labels to 	* erged dataset.
- Extract only columns containg mean and std deviation.
- Read activity labels from provided activity_labels.txt.
- Replace activity codes with labels in dataset.
- Rename the columns with more appopriate names.
- Group the dataset by subject and activity and calculate 	* ean.
- Write summary dataset to text file.
- Write tidy dataset to text file.






