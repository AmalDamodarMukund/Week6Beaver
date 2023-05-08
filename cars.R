cars <- mtcars
str(cars)


#histogram
attach(cars)
#compare yes and no with 1 chart
opar <- par(no.readonly = TRUE)
#arrange plots in 1 rows by 2 cols
par(mfrow = c(1,2))

with(cars,{
hist(wt, 
     col='steelblue', 
     main='Weight of the car')
})

with(cars,{
hist(mpg, 
     col='steelblue', 
     main='Miles/(US) gallon')
})

par(opar)

#qq plot

#compare yes and no with 1 chart
opar <- par(no.readonly = TRUE)
#arrange plots in 1 rows by 2 cols
par(mfrow = c(1,2))

with(cars,{
qqnorm(cars$wt, main = "Weight of the car")
qqline(cars$wt, col = "red")
})

with(cars,{
qqnorm(cars$mpg, main = "Miles/(US) gallon")
qqline(cars$mpg, col = "red")
})
par(opar)

#shapiro test

normality_test <- shapiro.test(cars$wt)
normality_test$p.value

normality_test <- shapiro.test(cars$mpg)
normality_test$p.value

#Dependent variable is Continuous 
#Independent variable is Continuous 
#Dependent variable is normally distributed
#So Pearson’s Correlation Coefficient 
correlation <- cor.test(cars$wt, cars$mpg, method = 'pearson')
correlation


#################

#Q4
#convert am to a factor as it is categorical
cars$am <- factor(cars$am,
                  labels = c("automatic", "manual"))

#check the distribution of the categorical variable
attach(cars)
library("lattice")
histogram(~hp | am, 
           data = cars, 
           main = "Horse power distribution by transmission type")

#gearbox shapiro test
tapply(hp, am, shapiro.test)

#Horsepower shapiro test
shapiro.test(hp)

#summary
#hp = not normally distributed (continuous) (independent)
#am = not normally distributed (Categorical) (dependent)

#So Wilcoxon-Mann Whitney test

wilcox.test(hp ~ am)

#P-value is 0.0457 so less than 0.05 so H0 is right, no link


