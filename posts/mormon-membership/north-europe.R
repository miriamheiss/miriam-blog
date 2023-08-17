library(tidyverse)
library(plotly)

country <- read.csv("files/membership_by_country.csv")
member_population <- read.csv("files/membership_and_population.csv")

member_population_clean <- member_population |>
  select(Country, Area, Members, Population, X2022, X.LDS)

north_europe <- member_population_clean |> 
  filter(Area == "Europe North")

clean_north_europe <- north_europe |>
  filter(!row_number() %in% c(1)) 

clean_north_europe |> 
  ggplot(aes(x = Members, y = Country))+ 
  geom_point()+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 30, hjust = 0.5, vjust = 0.5))

north_europe_percent <- clean_north_europe |> 
  ggplot(aes(x = Country, y = Population, text = X.LDS, words = Members))+
  geom_point()+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 30, hjust = 0.5, vjust = 0.5))+
  labs(title = "Population and Membership: Northern Europe")

ggplotly(north_europe_percent, tooltip = c("text", "words"))

