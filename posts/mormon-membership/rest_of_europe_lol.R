library(tidyverse)
library(plotly)

country <- read.csv("files/membership_by_country.csv")
member_population <- read.csv("files/membership_and_population.csv")

member_population_clean <- member_population |>
  select(Country, Area, Members, Population, X2022, X.LDS)

east_europe <- member_population_clean |> 
  filter(Area == "Europe East")

central_europe <- member_population_clean |> 
  filter(Area == "Europe Central")

unassigned <- member_population_clean |> 
  filter(Area == "Unassigned**")

europe <- rbind(east_europe, central_europe, unassigned)

europe |> 
  ggplot(aes(x = Members, y = Country))+ 
  geom_point()+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90, hjust = 0.5, vjust = 0.5))

member_percent <- europe |> 
  ggplot(aes(x = Country, y = Population, text = X.LDS, words = Members))+
  geom_point()+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90, hjust = 0.5, vjust = 0.5))+
  labs(title = "Population and Membership: Central and East Europe")

ggplotly(member_percent, tooltip = c("text", "words"))

