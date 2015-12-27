library(dplyr)

  # Read in the X test dataset
  test_x <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE);
  #dim(test_x);
  
  # Read in the test labels, these are activity (walking, laying etc.)
  test_y <- read.table("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
  #dim(test_y)
  
  # Rest in the test subject dataset, these are subjects (persons id)
  test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
  #dim(test_subject)
  
  # Merge the test datasets into a single dataframe (adding columns for subject and activity)
  test <- data.frame(test_subject, test_y, test_x)
  #dim(test)
  
  # Similarly for Training data
  # Read in the X training 
  train_x <- read.table("UCI HAR Dataset/train/X_train.txt", sep="",header=FALSE)
  
  # Read in the training labels
  train_y <- read.table("UCI HAR Dataset/train/y_train.txt", sep="",header=FALSE)
  
  # Read in the training subject 
  train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt",sep="", header=FALSE)
  
  # Merge test training datasets
  train <- data.frame(train_subject, train_y, train_x)
  
  # Combine the training and test running datasets
  orig_data <- rbind(train, test)
  #dim(orig_data)
  
  # Read in the measurement labels dataset
  features <- read.table("UCI HAR Dataset/features.txt", sep="", header=FALSE)
  # Convert the 2nd column into a vector (getting names of the features)
  feature_names <- as.vector(features[, 2])
  
  # Apply the feature names as column names to the combined dataset
  colnames(orig_data) <- c("subject_id", "activity_labels", feature_names)
  #dim(orig_data)
  #remove duplicate columns as there are some duplicate values which throws error later
  orig_data <- orig_data[, !duplicated(colnames(orig_data))]
  #dim(orig_data)
  
  # Select only the columns containing mean or standard deviations excluding freq and angle
  orig_data <- select(orig_data, contains("subject"), contains("label"), contains("mean"), contains("std"), -contains("freq"), -contains("angle"))
  
  # Read in the activity labels
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
  
  # Replace the activity codes in orig_data with their respective labels
  orig_data$activity_labels <- as.character(activity_labels[match(orig_data$activity_labels, activity_labels$V1), 'V2'])
 
  #clean up the variable names such as removing (), - and duplicate words 
  setnames(orig_data, colnames(orig_data), gsub("\\(\\)", "", colnames(orig_data)))
  setnames(orig_data, colnames(orig_data), gsub("-", "_", colnames(orig_data)))
  setnames(orig_data, colnames(orig_data), gsub("BodyBody", "Body", colnames(orig_data)))
  
  # Group the running data by subject and activity, then calculate the mean of each group.
  orig_data_summary <- orig_data %>%group_by(subject_id, activity_labels) %>%summarise_each(funs(mean))
  #head(orig_data_summary)
  
  # Write orig_data_summary to file
  write.table(orig_data_summary, file="data_summary.txt", row.name=FALSE)
  
  #Also write tidy orig_data for future reference
  write.table(orig_data, file="tidy_data.txt", row.name=FALSE)
 