#Read Data
setwd("~/Coursera/DataScience/5_Reproducible/week2")
activity <- read.csv("activity.csv")

#Convert Interval column to H:M:S format
mins <- as.vector(activity$interval)
mins <- sprintf("%04d00", mins)
mins <- format(strptime(mins, format = "%H%M%S"), format = "%H:%M:%S")

#Bind date and time
date <- as.vector(activity$date)
date <- format(strptime(date, format = "%Y-%m-%d"), format = "%Y-%m-%d")
dateTime <- as.data.frame(as.POSIXct(paste(date, mins), format = "%Y-%m-%d %H:%M:%S"))

#Recreate data frame with four columns: steps, datetime, date and time; clean up intermediary vectors & dataframe
date <- as.data.frame(date)
time <- as.data.frame(mins)
activity <- cbind(activity$steps,dateTime, date, time)
colnames(activity) <- c("steps", "datetime", "date", "time")
rm(dateTime, mins, date, time)