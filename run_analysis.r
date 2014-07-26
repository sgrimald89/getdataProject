library(plyr)
        
        
        #if the UCI HAR Dataset folder does not exist in the working directory it will 
        #download the data and create the folder in the working directory
if(!file.exists("UCI HAR Dataset")){
                fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                zipfile="UCI_HAR_data.zip"
                download.file(fileURL,destfile=zipfile,method="curl")
                unzip(zipfile, exdir=".")
        }

        #reads all the downloaded data
        testX<-read.table("UCI HAR Dataset/test/X_test.txt")
        testY<-read.table("UCI HAR Dataset/test/y_test.txt")
        testSubjects<-read.table("UCI HAR Dataset/test/subject_test.txt")
        trainingX <- read.table("UCI HAR Dataset/train/X_train.txt")
        trainingY<-read.table("UCI HAR Dataset/train/y_train.txt")
        trainingSubjects<-read.table("UCI HAR Dataset/train/subject_train.txt")
        #appends subjects data from test to training sets
        allSubjects<-rbind(testSubjects,trainingSubjects)
        names(allSubjects)<-"subject.number"
        #appends Y data from test to training sets
        allY<-rbind(testY,trainingY)
        names(allY)<-"activity_id"
        
        #appends X data from test to training sets
        allX<-rbind(testX,trainingX)
        #renames variables to more easily readable names
        features<-read.table("UCI HAR Dataset/features.txt")
        names(allX)<-features$V2
        
        relevantVariables<-c(grep("mean()",features$V2,fixed=TRUE), grep("std()",features$V2,fixed=TRUE))
        
        finalX<-allX[,relevantVariables]
        #combines the subject data the activity data and the features
        fulldata<-cbind(allSubjects,allY,finalX)

        #renames activity feature to a human readable format
        activities<- read.table("UCI HAR Dataset/activity_labels.txt")
        names(activities)<-c("activity_id","activity")
        cleanFull<-merge(activities,fulldata,by="activity_id")
        tidyData<-subset(cleanFull,select=-activity_id)
        #finds the average for each variable with a mean() or std() string
        aggdata<-aggregate(tidyData,by=list(subject.number=tidyData$subject.number,activity=tidyData$activity),FUN=mean,na.rm=TRUE)
        #deletes unnecearry new columns
        aggdata<-aggdata[,-c(3,4)]
        #outputs the table with the averages
        write.table(aggdata,"TidyData.txt")