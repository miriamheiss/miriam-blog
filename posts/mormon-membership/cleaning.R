library(tidyverse)
library(plotly)

country <- read.csv("files/membership_by_country.csv")
member_population <- read.csv("files/membership_and_population.csv")

member_population_clean <- member_population |>
  select(Country, Area, Members, Population, X2022, X.LDS)
