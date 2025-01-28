# Sarah Ogden
# STA305 HW 1

library(datasets)
library(FSA)
library(ggplot2)
library(dplyr)

data("mtcars")

# Cast values w limited number of values as factors
cardata = mtcars
cardata$cyl_F = as.factor(cardata$cyl)
cardata$gear_F = as.factor(cardata$gear)
cardata$vs_F = factor(cardata$vs,labels=c("V-shaped", "straight"))
cardata$am_F = factor(mtcars$am,labels=c("automatic","manual"))

# 3a
# overall
mean(cardata$hp)
sd(cardata$hp)
# by cylinders
aggregate(cardata$hp, list(cardata$cyl_F), FUN=mean)

# 3b
# overall
summary(cardata$mpg)
# by transmission
Summarize(mpg ~ am_F, data=cardata)

# 3c
XT = xtabs( ~ cyl_F , data=cardata)
XT
prop.table(XT)

# 3d
XT = xtabs( ~ vs_F + am_F, data=cardata)
XT

# 4
# graph 1 - pie graph of engine types
data <- data.frame(xtabs( ~ vs_F, data=cardata))
# Compute the position of labels
data <- data %>% 
  arrange(desc(vs_F)) %>%
  mutate(prop = Freq / sum(Freq) *100) %>%
  mutate(ypos = cumsum(prop)- 0.5*prop )
data
ggplot(data, aes(x="",y=prop,fill=vs_F)) +
  geom_bar(stat="identity",width=1) +
  coord_polar("y",start=0) +
  theme_void() +
  labs(fill='Engine Type',title="Percentage of each Engine Type") +
  geom_text(aes(y = ypos, label=paste0(prop, "%")))

# graph 2
data <- data.frame(xtabs( ~ cyl_F, data=cardata))
ggplot(data, aes(x=cyl_F,y=Freq,fill="")) +
  geom_bar(stat="identity") +
  theme(legend.position="none") +
  labs(x="Number of Cylinders",y="Amount of Cars",title="Number of Cylinders in each Car Engine")

# graph 3
ggplot(cardata, aes(x = carb)) +
  geom_dotplot(dotsize = 1) +
  labs(y="Frequency (%)",x="Number of Carburetors in Engine",title="Total Number of Carburetors in each Car")

# graph 4
ggplot(cardata, aes(x=mpg)) +
  geom_histogram() +
  labs(x="MPG",title="Car Engine MPG")

# 5
# graph 1
ggplot(cardata, aes(x=hp,y=qsec,color=gear)) +
  geom_point() +
  labs(x="Horsepower", y="1/4 Mile Time",title="Horsepower and 1/4 Mile Time")

# graph 2
ggplot(cardata, aes(x=hp,y=qsec,color=vs_F)) +
  geom_boxplot() +
  labs(x="Horsepower", y="1/4 Mile Time", color="Engine Shape",title="Horsepower and 1/4 Mile Time")

# graph 3
ggplot(cardata, aes(x=hp,y=mpg,size=wt)) +
  geom_point() +
  labs(x="Horsepower", y="MPG", size="Weight (1000lbs)",title="Horsepower and MPG")

# graph 4
ggplot(cardata, aes(x=hp,y=mpg,color=am_F)) +
  geom_boxplot() +
  labs(x="Horsepower",y="MPG",color="Transmission",title="Horsepower and MPG")