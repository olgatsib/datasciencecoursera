# extract and merge X data
trainX <- read.table("dataset/train/X_train.txt")
testX <- read.table("dataset/test/X_test.txt")
setX <- rbind(trainX, testX)

# extract and merge y data
trainy <- read.table("dataset/train/y_train.txt")
testy <- read.table("dataset/test/y_test.txt")
sety <- rbind(trainy, testy)

# add column names
features <- read.table("dataset/features.txt")
colnames(setX) <- tolower(features[[2]])

# extract only mean and std 
selcol <- grep("-mean\\(\\)|-std\\(\\)", colnames(setX))
setX <- setX[,selcol]

# add labels for activities
activity <- read.table("dataset/activity_labels.txt")
sety$id <- 1:nrow(sety)
descriptions <- merge(sety, activity, by="V1")
setLabels <- descriptions[order(descriptions$id),]
withlabels <- cbind(labels=setLabels$V2, setX)

# merge subject data
trainSubject <- read.table("dataset/train/subject_train.txt")
testSubject <- read.table("dataset/test/subject_test.txt")
setSubject <- rbind(trainSubject, testSubject)

# add subject data
final <- cbind(subject=setSubject[[1]], withlabels)

# get activity and subject average for each variable
tidy <- aggregate(final[,3:ncol(final)], by=list(final$subject, final$labels), mean)
colnames(tidy)[1] <- "subject"
colnames(tidy)[2] <- "label"

# order by subject
tidyBySubject <- tidy[with(tidy, order(subject, label)),]

# save to the file
write.table(tidyBySubject, file="tidy_data.txt", row.names=FALSE)