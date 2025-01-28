library(datasets)
data("mtcars")

# Question 1
head(mtcars, n=10)
tail(mtcars, n=10)

# Question 2 - Variable types
sapply(mtcars, class)

# Cast values w limited number of values as factors
cardata = mtcars
cardata$cyl_F = as.factor(cardata$cyl)
cardata$gear_F = as.factor(cardata$gear)
cardata$vs_F = factor(cardata$vs,labels=c("V-shaped", "straight"))
cardata$am_F = factor(mtcars$am,labels=c("automatic","manual"))

# Question 3 - Appropriate descriptive stat
# mpg: mean, sd
mean(cardata$mpg)
sd(cardata$mpg)

# cyl: mode
mode(cardata$cyl)

# disp: median, IQR
median(cardata$disp)
quartile()

# hp: mean, standard deviation

# drat: mean, standard deviation

# wt: mean, standard deviation

# qsec: mean, standard deviation

# vs: mode

# am: mode

# gear: median, IQR

# carb: median, IQR


# Question 4 - 4 Univariate graphs

# Question 5 - 4 Multivariate graphs