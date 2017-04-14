#set directory
setwd("C:/Users/583951/Documents/Coursera/JHU Data Science/3 - Getting and Cleaning Data/UCI HAR Dataset")

#get mean and std dev features, locations of columns to be used
features <- as.character(read.table(file = "features.txt")[,2])
filtered_features_index <- grepl("mean\\(\\)", features)|grepl("std\\(\\)", features)
filtered_features_names <- features[filtered_features_index]

#read test data and merge columns
subject_test <- read.table(file = "./test/subject_test.txt", header = FALSE)
x_test <- read.table(file = "./test/X_test.txt", header = FALSE)
y_test <- read.table(file = "./test/Y_test.txt", header = FALSE)
test_full <- cbind(subject_test, y_test, x_test)

#read train data and merge columns
subject_train <- read.table(file = "./train/subject_train.txt", header = FALSE)
x_train <- read.table(file = "./train/X_train.txt", header = FALSE)
y_train <- read.table(file = "./train/Y_train.txt", header = FALSE)
train_full <- cbind(subject_train, y_train, x_train)

#combine and subset data sets to get only mean and std dev columns
data_combined <- rbind(test_full, train_full)
colnames(data_combined) <- c("subject", "activity", features)
data_filtered <- data_combined[c(T,T,filtered_features_index)]

#replace numbers in activity column with descriptive names
activity_names <- as.character(read.table(file = "activity_labels.txt")[,2])
for (i in 1:6){
  data_filtered$activity[data_filtered$activity == i] <- activity_names[i]
}

#get table of averages grouped  by subject and activity
table_avgs <- aggregate(x = data_filtered[,3:68], by  =list(data_filtered$activity, data_filtered$subject), FUN = mean)
colnames(table_avgs)[1:2] <- c("activity", "subject")


