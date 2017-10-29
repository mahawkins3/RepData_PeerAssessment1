#Calculate average steps taken during each 5-minute interval
stepsPerTime <- with(activity,tapply(steps,time,mean, na.rm=TRUE))

#Plot line graph of steps across day
plot(stepsPerTime, type = "l", xlab = "5-minute intervals", ylab = "Average number of steps", 
     main = "Average steps taken throughout day by 5-minute intervals")

#Check for dependent package
if("nnet" %in% rownames(installed.packages()) == FALSE) {
  install.packages("nnet")
  }
library(nnet)

#Return 5-minute interval with highest average number of steps
which.is.max(stepsPerTime)