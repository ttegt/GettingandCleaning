library(dplyr)
#read in activity names
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                         header=FALSE, sep=" ")
names(activities) <- c("number", "activity")


#read in features
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, 
                       sep=" ")
names(features) <- c("featnum", "feature")


#load train values
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                            header=FALSE)
names(subject_train) <- "subject"
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
names(y_train) <- "activity"
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE) 
names(X_train) <- features[,2]

#combine training set
fulltrain <- cbind(subject_train, y_train, X_train)

#repeat with test set
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                          header=FALSE)
names(subject_test) <- "subject"
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
names(y_test) <- "activity"
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE) 
names(X_test) <- features[,2]
fulltest <- cbind(subject_test, y_test, X_test)

#combine train and test sets
fullset <- rbind(fulltrain, fulltest)

#select the mean and std columns (excludes things like "*meanFreq")
meansd <- grep("subject|activity|mean\\(\\)|std", names(fullset))
merged1 <- fullset[,meansd]

#tidying the variable names
names(merged1) <- gsub("-|\\(|\\)", "", names(merged1)) #remove non alphanumeric
#names(merged1) <- tolower(names(merged1))
names(merged1) <- gsub("^t", "time", names(merged1))
names(merged1) <- gsub("^f", "frequency", names(merged1))
names(merged1) <- gsub("std", "StandardDeviation", names(merged1))
names(merged1) <- gsub("mean", "Mean", names(merged1))
names(merged1) <- gsub("Mag", "Magnitude", names(merged1))
names(merged1) <- gsub("X$", "Xaxis", names(merged1))
names(merged1) <- gsub("Y$", "Yaxis", names(merged1)) 
names(merged1) <- gsub("Z$", "Zaxis", names(merged1))
names(merged1) <- gsub("BodyBody", "Body", names(merged1))

#naming activities

activity_namer <- function(x) activities[x,2]
merged1 <- mutate(merged1, activity = activity_namer(activity))

### merged1 is the first data set (through part 4) ###

#Write merged1 to a text file

write.table(merged1, "samsung1.txt", row.name=FALSE)

#mean by subject & activity

groupeddata <- group_by(merged1, subject, activity)
activity_mean <- summarize_each(groupeddata, funs(mean))

### activity_mean is the second data set ###

#write to a .txt file

write.table(activity_mean, "tidysamsung.txt", row.name=FALSE)