## Getting and Cleaning Data Project

+ The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data  		that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 
+ You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the 		analysis,and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the 	data called + CodeBook.md. 
+ You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are 	connected.  

+ One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like 	Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the 	course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available 		at the site where the data was obtained: 

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

	Here are the data for the project: 

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

+ You should create one R script called run_analysis.R that does the following. 
	Merges the training and the test sets to create one data set.
	Extracts only the measurements on the mean and standard deviation for each measurement. 
	Uses descriptive activity names to name the activities in the data set
	Appropriately labels the data set with descriptive variable names. 
	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each  	subject

### Data Set Information

+ The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six 	activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the 	waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a 		constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 		partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
	The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding 	windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion 		components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed 		to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 			features was obtained by calculating variables from the time and frequency domain.

### Project Steps
 For each record in the dataset it is provided: 
	+- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
	+- Triaxial Angular velocity from the gyroscope. 
	+- A 561-feature vector with time and frequency domain variables. 
	+- Its activity label. 
	+- An identifier of the subject who carried out the experiment.

 Merge the training and the test sets to create one data set.After setting the source directory for the files, read into tables the data located in
	+- features.txt
	+- activity_labels.txt
	+- subject_train.txt
	+- x_train.txt
	+- y_train.txt
	+- subject_test.txt
	+- x_test.txt
	+- y_test.txt

+ Assign column names and merge to create one data set.
+ Get the activity names from activity_labels.txt file and replace the activity numbers in Y_train and Y-test
+ merged dataset with activity names.

+ Extract only the measurements on the mean and standard deviation for each measurement. 
+ Subset this data to keep only the necessary columns.

+ Fix the prefixes in the data lables and replace with descriptive name 
+ Merge data subset with the activityType table to cinlude the descriptive activity names

+ Appropriately label the data set with descriptive activity names.

+ Create a tidy data by average of subject and activity for each variable. 
