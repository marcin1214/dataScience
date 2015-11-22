library(plyr)

###### 1

# read  X and Y real data

xtrain <- read.table("Getting and Cleaning Data/Project/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("Getting and Cleaning Data/Project/UCI HAR Dataset/train/Y_train.txt")
subj_train <- read.table("Getting and Cleaning Data/Project/UCI HAR Dataset/train/subject_train.txt")

# read X and Y test data

xtest <- read.table("Getting and Cleaning Data/Project/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("Getting and Cleaning Data/Project/UCI HAR Dataset/test/Y_test.txt")
subj_test <- read.table("Getting and Cleaning Data/Project/UCI HAR Dataset/test/subject_test.txt")

# merge data


 xdata <- rbind(xtrain, xtest)
 ydata <- rbind(ytrain, ytest)
 subj_data <- rbind(subj_train, subj_test)
 
 names(subj_data) <- "subject"      
 
 
 ###### 2 
 
 features <- read.table("Getting and Cleaning Data/Project/UCI HAR Dataset/features.txt")
 
 # reg exp to get rows with mean() and std()
 
 featuresReq <- grep ("-(mean|std)\\(\\)", features[, 2])
 
 # subset xdata
 
 xdata <- xdata[, featuresReq]
 
 #set the name of col
 
 names(xdata) <- features[featuresReq, 2]
 
 ###### 3
 
 activities <- read.table("Getting and Cleaning Data/Project/UCI HAR Dataset/activity_labels.txt")
 
 ydata[, 1] <- activities[ydata[, 1], 2]
 
 names(ydata) <- "activity"
 
 ###### 4

 # merge all of data
 
 alldata <- cbind(xdata, ydata, subj_data)
 
 
 ###### 5
 
 # create tidy dataset
 
 avg_data <- ddply(alldata, .(subject, activity), function(x) colMeans(x[, 1:66]))

 write.table(avg_data, "avg_data.txt", row.name=FALSE)
