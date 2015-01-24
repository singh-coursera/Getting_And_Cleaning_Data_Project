# Download the file, unzip and put in data1 folder
if(!file.exists("./data1")){dir.create("./data1")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./data1/Project1.zip")
unzip(zipfile="./data1/Project1.zip",exdir="./data1")
# Access the unzipped data from "UCI HAR Dataset". Get the unzipped files 
path <- file.path("./data1" , "UCI HAR Dataset")
files<-list.files(path, recursive=TRUE)
files
# Read the Features files
X_Test <- read.table(file.path(path, "test","X_test.txt"), header=FALSE)
X_Train <- read.table(file.path(path, "train", "X_train.txt"), header=FALSE)
# Read the Activity files
Y_Test <- read.table(file.path(path, "test","Y_test.txt"), header=FALSE)
Y_Train <- read.table(file.path(path, "train", "Y_train.txt"), header=FALSE)
# Read the Subject files
subject_Test <- read.table(file.path(path, "test","subject_test.txt"), header=FALSE)
subject_Train <- read.table(file.path(path, "train", "subject_train.txt"), header=FALSE)
# Check the structure of variables
str(X_Test)
str(X_Train)
str(Y_Test)
str(Y_Train)
str(subject_Test)
str(subject_Train)
# combine the features, activity and subject files along rows.
features_bind <- rbind(X_Test, X_Train)
activity_bind <- rbind(Y_Test, Y_Train)
subject_bind <- rbind(subject_Test, subject_Train)
# set the names to the variables for subject and activity
names(subject_bind) <- c("subject")
names(activity_bind) <- c("activity")
# Get the activity names from activity_labels.txt file and replace the activity numbers with 
# activity names
activity_labels <- read.table(file.path(path, "activity_labels.txt"), header=FALSE)
activity_bind[ ,1] <- activity_labels[activity_bind[ ,1], 2]
# set the names to variables for the features
features_Names_ref <- read.table(file.path(path, "features.txt"), header=FALSE)
names(features_bind)<- features_Names_ref$V2
# merge all features, subject and activity data
all_data <- cbind(features_bind, subject_bind, activity_bind)
# subset Names of Features by measurements on the mean and standard deviation.
sub_features_Names_ref <- features_Names_ref$V2[grep("mean\\(\\)|std\\(\\)", features_Names_ref$V2)]
# subset the data by names of features
selected_Names <- c(as.character(sub_features_Names_ref), "subject", "activity")
all_data_subset <- subset(all_data, select= selected_Names)
# check the structure of data
str(all_data_subset)
# check the activity labels on 50
head(all_data_subset$activity,50)
# the prefixes in the data lables is replaced by descriptive name 
names(all_data_subset)<-gsub("^t", "time", names(all_data_subset))
names(all_data_subset)<-gsub("^f", "frequency", names(all_data_subset))
names(all_data_subset)<-gsub("Acc", "Accelerometer", names(all_data_subset))
names(all_data_subset)<-gsub("Gyro", "Gyroscope", names(all_data_subset))
names(all_data_subset)<-gsub("Mag", "Magnitude", names(all_data_subset))
names(all_data_subset)<-gsub("BodyBody", "Body", names(all_data_subset))
# check
names(all_data_subset)

library(plyr);
# clean dataset is created by average of subject and activity for each variable.
Clean_data<-aggregate(. ~subject + activity, all_data_subset, mean)
Clean_data<-Clean_data[order(Clean_data$subject,Clean_data$activity),]
# tidydata output file is generated 
write.table(Clean_data, file = "tidydata.txt", row.name=FALSE)
