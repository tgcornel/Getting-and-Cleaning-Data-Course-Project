# This function reads data collected from the accelerometers from a smartphone,
# groups the data by subject and activity, and calculates the mean of a number of
# selected features. For more information, please check the README.md

func<-function(){
    library(dplyr)
  
    # Read test and training data sets
    test<-read.table('UCI HAR Dataset/test/X_test.txt')
    testact<-read.table('UCI HAR Dataset/test/y_test.txt')
    testsubj<-read.table('UCI HAR Dataset/test/subject_test.txt')
  
    train<-read.table('UCI HAR Dataset/train/X_train.txt')
    trainact<-read.table('UCI HAR Dataset/train/y_train.txt')
    trainsubj<-read.table('UCI HAR Dataset/train/subject_train.txt')
  
    activitylabels<-c("WALKING",
                      "WALKING_UPSTAIRS",
                      "WALKING_DOWNSTAIRS",
                      "SITTING",
                      "STANDING",
                      "LAYING")
    featurelabels<-readLines("UCI HAR Dataset/features.txt")
    featurelabels<-sub("[0-9]+ ","",featurelabels) # Remove numerical indices
    indices<-grep("mean\\(\\)|std\\(\\)",featurelabels) # Keep only mean() and std()
  
    # Merge test and train data sets
    merged<-rbind(test,train)
    activity<-rbind(testact,trainact)
    subject<-rbind(testsubj,trainsubj)
  
    # Keep only selected features, set descriptive column names
    names(merged)<-featurelabels
    merged<-merged[,indices]
  
    # Add subject and activity fields
    merged$subject <- subject$V1
    activityfact<-factor(activity$V1,labels=activitylabels)
    merged$activity<-activityfact
  
    # Group by subject and activity, calculate mean for each feature
    summ<-group_by(merged,subject,activity)
    summ<-summarize_each(summ,funs(mean))
    #print(summ)
  
    #Write out tidy data
    write.table(summ,file="tidy_data.txt",row.name=FALSE)
}

# Call the function
func()