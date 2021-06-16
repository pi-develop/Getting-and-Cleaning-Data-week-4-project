library(dplyr)
features <- read.table("*your path here*\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\features.txt", col.names = c("number","functions"))
activities <- read.table("*your path here*\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt", col.names = c("code", "activity"))
test1<-read.table("*your path here*\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt", col.names="participants")
test2<-read.table("*your path here*\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt", col.names = features$functions )
test3<-read.table("*your path here*\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt", col.names= "code")
test4<-cbind(test1,test2)
test5<-cbind(test4,test3)
test<-data.frame(test5)
train1<-read.table("*your path here*\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt", col.names="participants")
train2<-read.table("*your path here*\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt", col.names = features$functions)
train3<-read.table("*your path here*\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt", col.names="code")
train4<-cbind(train1,train2)
train5<-cbind(train4,train3)
train<-data.frame(train5)
combine<-rbind(train,test)
##opening all of the data and what not
##names edited out of my file names of course, just replace with your own path
combinecomplete <- combine %>% select(participants, contains("mean"), contains("std"),code)
##getting all of the means and standard deviations from the files
combinenamed<-merge(combinecomplete,activities, by="code")
##turning all the y files(codes) into their coresponding activities
names(combinenamed)<-gsub("Acc", "Accelerometer", names(combinenamed))
names(combinenamed)<-gsub("Gyro", "Gyroscope", names(combinenamed), ignore.case = TRUE)
names(combinenamed)<-gsub("BodyBody", "Body", names(combinenamed), ignore.case = TRUE)
names(combinenamed)<-gsub("Mag", "Magnitude", names(combinenamed), ignore.case = TRUE)
names(combinenamed)<-gsub("^t", "Time", names(combinenamed), ignore.case = TRUE)
names(combinenamed)<-gsub("^f", "Frequency", names(combinenamed), ignore.case = TRUE)
names(combinenamed)<-gsub("tBody", "TimeBody", names(combinenamed), ignore.case = TRUE)
names(combinenamed)<-gsub("-mean()", "Mean", names(combinenamed), ignore.case = TRUE)
names(combinenamed)<-gsub("-std()", "STD", names(combinenamed), ignore.case = TRUE)
names(combinenamed)<-gsub("-freq()", "Frequency", names(combinenamed), ignore.case = TRUE)
names(combinenamed)<-gsub("angle", "Angle", names(combinenamed), ignore.case = TRUE)
names(combinenamed)<-gsub("gravity", "Gravity", names(combinenamed), ignore.case = TRUE)
##making all the names more comprehensible and sensible, including casing 
combinenamed2<-combinenamed[2:89]
##getting rid of the code row left behind by the merge command
combinefinal <- combinenamed2 %>%
  group_by(participants, activity) %>%
  summarise_all(list(mean))
write.table(combinefinal, "combinefinal.txt", row.name=FALSE)
##doing all the opperations for step 5 and writing the file itself
