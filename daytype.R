#Create column to determine if weekday or weekend
activityImp$daytype <- as.factor(ifelse(weekdays(activityImp$datetime) %in% c("Saturday", "Sunday"), "Weekend", "Weekday"))

#Check for dependent package
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {
  install.packages("ggplot2")
}
library(ggplot2)

#Calculate avg steps per interval for weekday vs weekends
activityWD <- aggregate(activityImp$steps, by = list(activityImp$daytype, activityImp$time), FUN = mean)
colnames(activityWD) <- c("daytype", "time", "steps")

#Panel plot with time series
ggplot(activityWD, aes(x = time, y = steps, color = daytype, group = 1))+
  geom_line()+
  labs(title = "Average steps by time of day: Weekday vs Weekend", x = "time", y = "Average steps")+
  facet_grid(daytype~.)