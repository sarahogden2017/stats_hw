library(datasets)
data("mtcars")

## Question 1
head(mtcars, n=10)
tail(mtcars, n=10)

## Question 2
sapply(mtcars, class)

## Cast Engine, Transmission, and Cylinders as factors
cardata = mtcars
cardata$cyl_F = as.factor(cardata$cyl)
cardata$vs_F = factor(cardata$vs,labels=c("V-shaped", "straight"))
cardata$am_F = factor(mtcars$am,labels=c("automatic","manual"))

## Question 3
