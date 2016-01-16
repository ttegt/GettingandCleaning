library(tidyr);library(dplyr)
#read in activity names
activities<-read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,sep=" ")
names(activities)<-c("number", "activity")


#read in features
features<-read.table("./UCI HAR Dataset/features.txt",header=FALSE,sep=" ")
names(features)<-c("featnum","feature")
meansd<-grep("mean|std", features[,2])

#load train values
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
names(subject_train)<-"subjectid"
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
names(y_train)<-"activity"
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE) #this takes time
names(X_train)<-features[,2]

#combine training set
fulltrain<-cbind(subject_train,y_train,X_train)

#repeat with test set
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
names(subject_test)<-"subjectid"
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
names(y_test)<-"activity"
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE) #this takes time
names(X_test)<-features[,2]
fulltest<-cbind(subject_test,y_test,X_test)

#combine train and test sets
fullset<-rbind(fulltrain,fulltest)

#select the mean and std columns
meansd<-grep("subjectid|activity|mean|std", names(fullset))
msddf<-fullset[,meansd]

#naming activities
activity_namer<-function(x) activities[x,2]
msddf<-mutate(msddf,activity=activity_namer(activity))

#mean by subject & activity
groupeddata<-group_by(msddf,subjectid,activity)
activity_mean<-summarize_each(groupeddata,funs(mean))

write.table(activity_mean,"tidysamsung.txt",row.name=FALSE)