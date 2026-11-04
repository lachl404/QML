library(tidyverse)
library(cowsay)
library(fortunes)
getwd()

load("./data/coretta2018a/ita_egg.rda")

ita_egg |>
  group_by(backness) |>
  summarise(
    vot_mean = round(mean(vot, na.rm = TRUE)), vot_sd = round(sd(vot, na.rm = TRUE)),
    vot_min = round(min(vot, na.rm = TRUE)), vot_max = round(max(vot, na.rm = TRUE)),
    vot_median = round(median(vot, na.rm = TRUE))
  )

ita_egg |>
  group_by(height) |>
  summarise(
    vot_mean = round(mean(vot, na.rm = TRUE)), vot_sd = round(sd(vot, na.rm = TRUE)),
    vot_min = round(min(vot, na.rm = TRUE)), vot_max = round(max(vot, na.rm = TRUE)),
    vot_median = round(median(vot, na.rm = TRUE))
  )

ita_egg |>
  group_by(c1_place) |>
  summarise(
    vot_mean = round(mean(vot, na.rm = TRUE)), vot_sd = round(sd(vot, na.rm = TRUE)),
    vot_min = round(min(vot, na.rm = TRUE)), vot_max = round(max(vot, na.rm = TRUE)),
    vot_median = round(median(vot, na.rm = TRUE))
  )

ita_egg |>
  group_by(c2_place) |>
  summarise(
    vot_mean = round(mean(vot, na.rm = TRUE)), vot_sd = round(sd(vot, na.rm = TRUE)),
    vot_min = round(min(vot, na.rm = TRUE)), vot_max = round(max(vot, na.rm = TRUE)),
    vot_median = round(median(vot, na.rm = TRUE))
  )

ita_egg |>
  group_by(v1_duration) |>
  summarise(
    vot_mean = round(mean(vot, na.rm = TRUE)), vot_sd = round(sd(vot, na.rm = TRUE)),
    vot_median = round(median(vot, na.rm = TRUE))
  )

#continuous variables cant be used in group_by

#next data set




