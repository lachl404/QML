library(tidyverse)
library(cowsay)
library(fortunes)
library(ritwals)
getwd()
data("WALS")


#setup done

WALS_COUNTS <- WALS |>
  group_by(feature_ID, value_ID) |>
  count()

WALS |> 
  summarise(
    
  )

