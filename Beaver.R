str(beaver2)
summary(beaver2)

beavers_data <- beaver2

pairs(beavers_data,
      labels = colnames(beavers_data),
      main = "Beavers dataset correlation plot")


#labels start with what is assigned to lower value first
beavers_data$activity <- factor(beavers_data$activ, labels = c("no" , "yes"))
View(beavers_data)

attach(beavers_data)
tapply(temp,activity,summary)

plot(beavers_data$activity,
     temp,
     pch = 19,
     col = "lightblue")


#Display the normality of data
hist(temp, 
     col='steelblue', 
     main='Frequency chart of temp')

#not correct because it is not showing distributed data because it is categorical data
hist(beavers_data$activ, 
     col='steelblue', 
     main='Frequency chart of activity')

library(lattice)
histogram(~temp | activity,
          data = beavers_data,
          main = "Distribuion of beaver activity data" , 
          xlab = "Temp (degrees)",
          ylab = "Activity (%)")


#Q-Q plot can help to determine normality
qqnorm(beavers_data$temp)
qqline(temp, col = "red")

qqnorm(beavers_data$activ)
qqline(temp, col = "red")

with(beavers_data,
     qqnorm(beavers_data$temp[beavers_data$activity] == "no",
            beavers_data$temp[beavers_data$activity] == "yes",
            main = "Comparing 2 samples of activity data",
            xlab = "Active = Yes",
            ylab = "ACtive = No"))
                          
                          
