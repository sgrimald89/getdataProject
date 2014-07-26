#getdataProject
===================================================================
##Getting and Cleaning Data Project
###Project for getdata-005 on Coursera.

####Original instructions:
You should create one R script called run_analysis.R that does the following.
 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
####Steps in run_analysis.R:

1. Downloads the UCI HAR Dataset into working directory

2. unzips the .zip file

3. Appends the test and training datasets for X, Y and Subject code datasets.

4. Corrects the feature names

5. Keeps only features in the X dataset that contain "std()" or "mean()"

6. Merges the X,Y,and subjects datasets

7. Converts the activity variable into a human readable format

8. Calculates the average for each of the variables by subject and activity

9. Outputs "TidyData.txt" that is tidy.

 
###Notes and Sources:
Note: For details on the variable names, please see codebook.txt.

Source: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
