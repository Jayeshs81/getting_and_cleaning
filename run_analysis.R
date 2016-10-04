#Read the data files
activityNames <- read.table("activity_labels.txt", sep="")
featureName <- read.table("features.txt", sep="")
subTrainData <- read.table("train/subject_train.txt", sep="")
subTestData <- read.table("test/subject_test.txt", sep="")
trainData <- read.table("train/X_train.txt", sep="")
testData <- read.table("test/X_test.txt", sep="")
trainYData <- read.table("train/y_train.txt", sep="")
testYData <- read.table("test/y_test.txt", sep="")

#Name the columns
names(activityNames) <- c("id", "activiy")
names(subTrainData) <- c("subject")
names(subTestData) <- c("subject")
names(trainData) <- featureName$V2
names(testData) <- featureName$V2
names(trainYData) <- c("id")
names(testYData) <- c("id")

#Create the merged data set
mergedTrainYData <- merge(trainYData, activityNames, by.x = "id", by.y = "id", all = FALSE, sort = FALSE)
mergedTestYData <- merge(testYData, activityNames, by.x = "id", by.y = "id", all = FALSE, sort = FALSE)
finalTrainData <- cbind(trainData[, which(grepl("mean|std", names(trainData)))], "activity"=mergedTrainYData$activiy, subTrainData)
finalTestData <- cbind(testData[, which(grepl("mean|std", names(testData)))], "activity"=mergedTestYData$activiy, subTestData)
finalData <- rbind(finalTrainData, finalTestData)

#Create the summary tidy data set
molten <- melt(finalData, id.vars = c(80:81), measure.vars = c(1:79))
secondDataSet <- molten %>% group_by(activity, subject, variable) %>% summarize(average = mean(value))
write.table(secondDataSet,"result.txt", row.names = FALSE)
secondDataSet