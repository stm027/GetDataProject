
run_analysis <- function() {

require(reshape2)

#Reads all of the data into the function to be worked with later
X.test<-read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
y.test<-read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subject.test<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
X.train<-read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
y.train<-read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
subject.train<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
features<-read.table(".\\UCI HAR Dataset\\features.txt")

#Binds all the raw data into one data frame
all.test<-cbind(subject.test,y.test,X.test)
all.train<-cbind(subject.train,y.train,X.train)
all.data <- rbind(all.test,all.train)

#Applies column names from features and creates 
#an index for only mean and stdev
colnames(all.data)<-c("Subject","Activity",as.vector(features[,2]))
index<-c(1,2,grep("mean\\(|std\\(",features[,2])+2)

good.data<-all.data[,index]

#Names the activities
good.data[,2] <- sub(1,"WALKING",good.data[,2])
good.data[,2] <- sub(2,"WALKING_UPSTAIRS",good.data[,2])
good.data[,2] <- sub(3,"WALKING_DOWNSTAIRS",good.data[,2])
good.data[,2] <- sub(4,"SITTING",good.data[,2])
good.data[,2] <- sub(5,"STANDING",good.data[,2])
good.data[,2] <- sub(6,"LAYING",good.data[,2])

melt.data <- melt(good.data,id.vars=c("Activity","Subject"))
cast.data <- dcast(melt.data, Activity + Subject ~ variable, mean)

write.table(cast.data, "tidydata.txt", row.name=FALSE)
}
