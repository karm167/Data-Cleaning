# analysis file for the final project.
# Step1 : save the unziped files into the working directory
  #the next line will load the files into R
  # first the training set.

trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

 # next the test set.

testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# the next steps will combines training and test sets

data_X= rbind(trainX,testX)
data_Y=rbind(trainY,testY)
data_subject=rbind(train_subject,test_subject)

# Read the feature vector

features <- read.table("./UCI HAR Dataset/features.txt")

# Read the  activity labels

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("ActivityID", "ActivityType")

# We now assign colomns name to our datasets.

colnames(data_X) <- features[, 2]
colnames(data_Y) <- "ActivityID"
colnames(data_subject) <- "SubjectID"

# Select the relevant columns for our measurement data set

Mean_Std <- grepl("mean\\(\\)|std\\(\\)", colnames(data_X))
Main_data_X=data_X[,Mean_Std]

# Here is the clean data

Clean_data=cbind(data_subject,data_Y,Main_data_X)

# attaching the acivity type to the clean data

Clean_Data=merge(activity_labels,Clean_data, by="ActivityID", all.x=TRUE)

# Making the columns names more descriptive

colnames(Clean_Data) <- gsub("Mag", "Magnitude", colnames(Clean_Data))
colnames(Clean_Data) <- gsub("BodyBody", "Body", colnames(Clean_Data))
colnames(Clean_Data) <- gsub("^t", "time", colnames(Clean_Data))
colnames(Clean_Data) <- gsub("^f", "frequency", colnames(Clean_Data))
colnames(Clean_Data) <- gsub("Acc", "Accelerometer", colnames(Clean_Data))
colnames(Clean_Data) <- gsub("Gyro", "Gyroscope", colnames(Clean_Data))

#  Creating the final set
library(dplyr)
Final_Set <- Clean_Data %>%
  group_by(SubjectID, ActivityID, ActivityType) %>%
  summarise_all(mean)

# Writing the final set to a txt file
write.table(Final_Set, "Final_Set.txt", row.names = FALSE)


