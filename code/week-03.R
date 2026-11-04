library(tidyverse)
library(cowsay)
library(fortunes)

shallow <- read_csv("./data/song2020/shallow.csv")
RT_mean = mean(RT)

summarise(shallow, RT_mean = mean(RT))
num <- 867.3592
round(num)
round(num, 1)
round(num, 2)

summarise(shallow, RT_mean=round(mean(RT)))

# round the mean and SD
summarise(shallow, RT_mean = mean(RT), RT_sd =sd(RT))

summarise(shallow, RT_min =min(RT), RT_max =max(RT))

# the correct code is actually:

summarise(
  shallow,
  RT_mean = round(mean(RT)), RT_sd = round(sd(RT)),
  RT_min = round(min(RT)), RT_max = round(max(RT))
  
)
# In the form of a report, the data produced from this code could be written as the following: 'Reaction times are on average 867ms long (SD=293ms), with values ranging from 0 to 1994ms

#test code to calculate the median...

summarise(
  shallow,
  RT_median = round(median(RT)), 
  RT_min = round(min(RT)), RT_max = round(max(RT))
)

#NA values:

a <- c(3, 5, 3, NA, 4) #calculating the mean of a creates NA...

mean(a)

#operations on the vector will return NA even if only one value is NA, regardless of which operation you use. 
#you should set na.rm to TRUE.

mean(a, na.rm = TRUE)
sum(a, na.rm = TRUE)
sd(a, na.rm = TRUE)

c <- c(4,23,NA,5)

mean(c, na.rm = TRUE)


#Grouping data GROUP_BY()

shallow_g <- group_by(shallow, Group)

# Get the rounded mean, median, SD, minimum and maximum of RTs for L1 and L2 participants in shallow_g.

summarise(
  shallow_g,
  RT_mean = round(mean(RT)), RT_median = round(median(RT)), RT_sd = round(sd(RT)),
  RT_min = round(min(RT)), RT_max = round(max(RT))
)

#pipes

shallow |> 
  group_by(Group) |> 
  summarise(mean = round(mean(RT)))

#more grouping , Word_type <- group_by(shallow, Word_Nonword)

shallow |>
  group_by(Group) |>
  summarise(mean = round(mean(RT)))

#new categories

shallow |>
  group_by(Group, Word_Nonword) |>
  summarise(
    RT_mean = round(mean(RT)), RT_median = round(median(RT)), RT_sd = round(sd(RT)),
    RT_min = round(min(RT)), RT_max= round(max(RT))
  )

#counting observations with count()

glot_status <- read_rds("./data/coretta2022/glot_status.rds")

glot_status |> 
  group_by(status) |>
  summarise(n = n())

#OR

glot_status |>
  count(status)
  
glot_status |>
  count(status, Macroarea)

#Getting unique values with distinct()

shallow |>
  count(Group)

shallow |>
  distinct(ID)

shallow |> 
  distinct(Group, ID)


