#Calculate sum of steps per day
stepsPerDay <- with(activity,tapply(steps,date,sum))

#Draw histogram of frequency of steps per day
hist(stepsPerDay, main = "Histogram: Total Steps per Day", xlab = "Total Steps per Day", col = "light grey")

#Calculate mean and median steps per day
mean(stepsPerDay, na.rm = TRUE)
median(stepsPerDay, na.rm = TRUE)