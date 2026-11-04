# Transform data using filter() and mutate()

#Filtering Rows

library(tidyverse)
library(dplyr)
library(stringr)

glot_status <- readRDS("./data/coretta2022/glot_status.rds")
glot_status

#Logical operators
# x == y : x is equal to y, x!=y : x is not equal to y, 

extinct = glot_status |>
  filter(status == "extinct")

not_extinct = glot_status|>
  filter(status != "extinct")

notext_SAmerica = glot_status |>
  filter(status != "extinct", Macroarea == "South America")

not_endangered = glot_status |>
  filter(status == "not_endangered", Macroarea != "Eurasia") #same as the code on line 20-21, different operators 

# %in% operator that returns TRUE if the value to the left is one of the values in the vector to its right, FALSE if not

5 %in% c(1, 2, 3, 4, 5)

10 %in% c(1,2,3,4,5)

#The value on the left foes not have to be a single value, it can also be a vector. %in% is a vectorised function

c(1,5) %in% c(4,1,7,5,8)


stocked = c("durian", "banana", "grapes")
needed = c("durian", "apples")

needed %in% stocked

Global_South = glot_status |>
  filter(
    Macroarea %in% c("Africa", "Australia", "Papunesia", "South America"),
    status %in% c("threatened", "shifting", "moribund", "nearly_extinct")
  )

#Mutating columns

unique(glot_status$Code_ID)

glot_status = glot_status |>
  mutate(
    Status =str_remove(Code_ID, "aes-")
  )
#This code mutates the original tibble and creates a new 'Status' column where the aes suffix is removed 
#Mutate is used for this purpose, to alter the already existing columns

status_count = glot_status |>
  group_by(Status)|>
  count()

glot_status |>
  group_by(status)|>
  count()

# Quarto 
