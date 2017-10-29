#Calculate total NAs in dataset
sum(is.na(activity$steps))

#Impute missing values based on avg steps in interval on days with complete measurements, rounding to nearest integer
avgTime <- cbind(unique(activity$time),as.data.frame(stepsPerTime))
colnames(avgTime) <- c("time","avgsteps")
activityAvgs <- merge(activity, avgTime, by = "time")
activityAvgs$stepsImp <- ifelse(is.na(activityAvgs$steps), round(activityAvgs$avgsteps, digits = 0), activityAvgs$steps)

#New dataframes containing imputed values
activityImp <- merge(activity, activityAvgs, by = "datetime")
activityImp <- activityImp[, c(1,3,4,9)]
colnames(activityImp) <- c("datetime", "date", "time", "steps")

#Calculate sum of steps per day
stepsPerDayImp <- with(activityImp,tapply(steps,date,sum))

hist(stepsPerDayImp, col = "dark grey", xlab = "Total Steps per Day", main = "Steps per day (missing values imputed)")

mean(stepsPerDayImp)
median(stepsPerDayImp)