
# Load libraries ----------------------------------------------------------
library(tidyverse)
library(spotifyr)
library(patchwork)

# Spotify IDs -------------------------------------------------------------



# These are the IDs

# results <- search_spotify("J. S. Bach", type = "artist")
#bach_id <- "5aIqB5nVVvmFsvSdExz408"


# Find TS spotify id
# results <- search_spotify("Taylor Swift", type = "artist")
#ts_id <- "06HL4z0CvFAxyc27GXpf02"



# Get data from Spotify---------------------------------------------------

# taylor_swift_raw <- get_artist_albums(ts_id)
# saveRDS(taylor_swift_raw, "data/ts_albums.rds")
ts_albums_raw <- readRDS("data/ts_albums.rds")

# ts_audio_raw <- get_artist_audio_features(ts_id)
# saveRDS(ts_audio_raw, "data/ts_audio.rds")
ts_audio_raw <- readRDS("data/ts_audio.rds")

#bach_albums_raw <- get_artist_albums(bach_id)
#saveRDS(bach_albums_raw, "data/bach_albums_raw.rds")
bach_albums_raw <- readRDS("data/bach_albums_clean.rds")

# bach_audio_raw <- get_artist_audio_features(bach_id)
# saveRDS(bach_audio_raw, "data/bach_audio.rds")
bach_audio_raw <- readRDS("data/bach_audio.rds")

albums <- c("evermore (deluxe version)",
            "folklore (deluxe version)",
            "Lover",
            "reputation",
            "1989",
            "Red (Taylor's Version)",
            "Speak Now",
            "Fearless (Taylor's Version)",
            "Taylor Swift")

bach_albums_clean <- c("J. S. Bach: Cantatas", 
                       "Invention", 
                       "Bach on Porthan Organ",
                       "Innovations: Bach")

write_rds(bach_albums_clean, "data/bach_albums_clean.rds")
write_rds(albums, "data/ts_albums_clean.rds")



# Energy plot -------------------------------------------------------------

ts_graph<- ggplot(data = ts_cleaned,
                  mapping = aes(x = key_mode,
                                y = energy,
                                color = album_name, 
                                text = track_name))+ 
  geom_hline(yintercept = 0.5)+
  geom_point(size = 2)+ 
  scale_color_manual(values = c("deepskyblue2",
                                "lightsalmon4",
                                "goldenrod",
                                "seashell4",
                                "palevioletred1",
                                "darkred",
                                "grey20",
                                "orchid4",
                                "palegreen4"),
                     guide = guide_legend(ncol = 2, 
                                          title.position = "top"))+ 
  labs(title = "Energy by Key (Taylor Swift)",
       y = "Energy",
       x = "Key", 
       color = "Album")+ 
  annotate(geom = "label", x = "A# minor", y = 0, label = "Low")+ 
  annotate(geom = "label", x = "A# minor", y = 1, label = "High")+ 
  theme_linedraw(base_size = 12)+ 
  theme(axis.text.x = element_text(angle = 90), legend.position = "bottom")


write_rds(ts_graph, "data/ts_energy_plot.rds")


bach_graph <- bach_cleaned %>%  
  ggplot(mapping = aes(x = key_mode, 
                       y = energy, 
                       color = album_name, 
                       text = track_name))+ 
  geom_hline(yintercept = 0.5)+
  geom_point(size = 2) + 
  scale_color_manual(values = c("#dbac00",
                                "#3e8996",
                                "#913e96",
                                "#de81a0"),
                     guide = guide_legend(ncol = 2, 
                                          title.position = "top"))+
  scale_y_continuous(breaks = c(0.0, 0.25, 0.50, 0.75, 1.00)) + 
  coord_cartesian(ylim = c(0.0, 1.00))+ 
  theme_linedraw(base_size = 12)+
  theme(axis.text.x = element_text(angle = 90), legend.position = "bottom")+ 
  labs(title = "Energy by Key (J. S. Bach)", 
       x = "Key", 
       y = "Energy",
       color = "Album",
       caption = "Source: Spotify")+ 
  annotate(geom = "label", x = "A# minor", y = 0, label = "Low")+ 
  annotate(geom = "label", x = "A# minor", y = 1, label = "High")

write_rds(bach_graph, "data/bach_energy_plot.rds")




# Valence plot ------------------------------------------------------------
## TS energy----
ts_tempo <- ts_cleaned %>%   
  ggplot(mapping = aes(x = tempo,
                       y = valence))+ 
  geom_point(aes( color = album_name),size = 2.5)+ 
  geom_smooth(se = FALSE, color = "black", method = "loess", formula = y~x) +
  theme_linedraw(base_size = 12)+
  theme(legend.position = "bottom")+ 
  scale_color_manual(values = c("deepskyblue2",
                                "lightsalmon4",
                                "goldenrod",
                                "seashell4",
                                "palevioletred1",
                                "darkred",
                                "grey32",
                                "orchid4",
                                "palegreen4"), 
                     guide = guide_legend(ncol = 2,
                                          title.position = "top"))+ 
  labs(title = "Valence by Tempo (Taylor Swift)", 
       x = "Tempo",
       y = "Valence",
       color = "Album")

write_rds(ts_tempo, "data/ts_tempo_plot.rds")
## Bach energy------------------------------

bach_graph <- bach_cleaned %>%  
  ggplot(mapping = aes(x = key_mode, 
                       y = energy, 
                       color = album_name, 
                       text = track_name))+ 
  geom_hline(yintercept = 0.5)+
  geom_point(size = 2) + 
  scale_color_manual(values = c("#dbac00",
                                "#3e8996",
                                "#913e96",
                                "#de81a0"),
                     guide = guide_legend(ncol = 2, 
                                          title.position = "top"))+
  scale_y_continuous(breaks = c(0.0, 0.25, 0.50, 0.75, 1.00)) + 
  coord_cartesian(ylim = c(0.0, 1.00))+ 
  theme_linedraw(base_size = 12)+
  theme(axis.text.x = element_text(angle = 90), legend.position = "bottom")+ 
  labs(title = "Energy by Key (J. S. Bach)", 
       x = "Key", 
       y = "Energy",
       color = "Album",
       caption = "Source: Spotify")+ 
  annotate(geom = "label", x = "A# minor", y = 0, label = "Low")+ 
  annotate(geom = "label", x = "A# minor", y = 1, label = "High")

write_rds(bach_graph, "data/bach_energy_plot.rds")

#Valence--------------------------------------------------------
## TS V ----

ts_tempo <- ts_cleaned %>%   
  ggplot(mapping = aes(x = tempo,
                       y = valence))+ 
  geom_point(aes( color = album_name),size = 2.5)+ 
  geom_smooth(se = FALSE, color = "black", method = "loess", formula = y~x) +
  theme_linedraw(base_size = 12)+
  theme(legend.position = "bottom")+ 
  scale_color_manual(values = c("deepskyblue2",
                                "lightsalmon4",
                                "goldenrod",
                                "seashell4",
                                "palevioletred1",
                                "darkred",
                                "grey32",
                                "orchid4",
                                "palegreen4"), 
                     guide = guide_legend(ncol = 2,
                                          title.position = "top"))+ 
  labs(title = "Valence by Tempo (Taylor Swift)", 
       x = "Tempo",
       y = "Valence",
       color = "Album")

write_rds(ts_tempo, "data/ts_tempo_plot.rds")

## Bach V----

bach_tempo <- bach_cleaned %>%
  ggplot(mapping = aes(x = tempo,
                       y = valence))+ 
  coord_cartesian(ylim = c(0.0, 1))+
  geom_point(aes(color = album_name), size = 2.5)+ 
  geom_smooth(se = FALSE, method = "loess", formula = y~x, color = "black")+
  theme_linedraw(base_size = 12)+
  theme(legend.position = "bottom")+
  scale_color_manual(values = c("#dbac00",
                                "#3e8996",
                                "#913e96",
                                "#de81a0"), 
                     guide = guide_legend(ncol = 2, 
                                          title.position = "top"))+ 
  labs(title = "Valence by Tempo (J. S. Bach)",
       x = "Tempo",
       y = "Valence",
       color = "Album",
       caption = "Source: Spotify") +
  scale_y_continuous(expand = c(0, 0))

write_rds(bach_tempo, "data/bach_tempo_plot.rds")


# Length----
## Ts----

mean_ts <- mean(ts_audio_clean$duration_ms) / 1000 / 60
 
ts_duration <- ts_cleaned %>% 
  filter(album_name %in% ts_albums) %>% 
  select(duration_ms, album_name) %>% 
  mutate(minutes = duration_ms / 1000 / 60) %>% 
  ggplot(mapping = aes(y = minutes,
                       x = album_name,
                       color = album_name))+
  geom_hline(yintercept = 3.5, color = "brown2", size = 0.75, linetype = "dashed")+
  geom_hline(yintercept = mean_ts, color = "cadetblue", size = 0.75)+
  geom_point()+ 
  scale_color_manual(values = c("deepskyblue2",
                                "lightsalmon4",
                                "goldenrod",
                                "seashell4",
                                "palevioletred1",
                                "darkred",
                                "grey32",
                                "orchid4",
                                "palegreen4"))+
  scale_y_continuous(breaks = c(1, 3, 2, 4, 5, 6, 7, 8, 9, 10)) + 
  coord_cartesian(ylim = c(1, 10)) + 
  theme_linedraw(base_size = 12)+
  theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position = "none")+ 
  labs(title = "Play Time (Taylor Swift) in minutes",
       subtitle = "Most songs are between 3 and 5 minutes",
       y = "Length (Minutes)",
       x = NULL)+
  annotate(geom = "segment", x = 3.5, xend = 3.5, y = 1.5, yend = 3.5,
          arrow = arrow(length = unit(0.5, "lines")))+
  annotate(geom = "label", x = 4, y = 1.5, label = "Average Length of Songs (2022)")+
  annotate(geom = "segment", x = 4.5, xend = 4.5, y = 6.5, yend = 4,
           arrow = arrow(angle = 15, length = unit(0.5, "lines")))+
  annotate(geom = "label", x = 5, y = 6.5, label = "Average Length (Taylor Swift)", fill = "cadetblue", color = "white")
  

write_rds(ts_duration, "data/ts_length_plot.rds")

## Bach----

bach_mean <- mean(bach_audio_clean$duration_ms) / 1000 / 60

bach_duration <- bach_cleaned %>% 
  filter(album_name %in% bach_albums) %>%
  mutate(minutes = duration_ms / 1000 / 60) %>% 
  ggplot(mapping = aes(y = minutes,
                       x = album_name,
                       color = album_name)) +
  geom_hline(yintercept = 3.5, color = "brown2", size = 0.75, linetype = "dashed")+
  geom_hline(yintercept = bach_mean, color = "darkblue", size = 0.75)+
  geom_point()+
  scale_color_manual(values = c("lightpink3",
                                "paleturquoise4",
                                "thistle4",
                                "#a8325a"))+
  scale_y_continuous(breaks = c(1, 3, 2, 4, 5, 6, 7, 8, 9, 10)) + 
  coord_cartesian(ylim = c(1, 10)) + 
  theme_linedraw(base_size = 12)+ 
  theme(legend.position = "none", axis.text.x = element_text(angle = 90, hjust = 1))+ 
  labs(title = "Play Time (Bach) in minutes",
       subtitle = "Most pieces are between 1 and 3 minutes",
       y = "Length (Minutes)",
       x = NULL,
       caption = "Source: Spotify")+ 
  annotate(geom = "label", x = 1.08, y = 1.5, 
           label = "Average Length\n(Bach)", 
           fill = "darkblue", 
           color = "white")

write_rds(bach_duration, "data/bach_length_plot.rds")



# Interactive plots -------------------------------------------------------

## ts ----------------------------------------------------------------------


ts_audio_clean <- readRDS("data/ts_clean_audio.rds") # D
ts_albums_clean <- read_rds("data/ts_albums.rds") # V

ts_graph <- ggplot(data = ts_audio_clean,
                   mapping = aes(x = key_mode,
                                 y = energy,
                                 color = album_name, 
                                 text = track_name))+ 
  geom_hline(yintercept = 0.5)+
  geom_point(size = 2)+ 
  scale_color_manual(values = c("deepskyblue2",
                                "lightsalmon4",
                                "goldenrod",
                                "seashell4",
                                "palevioletred1",
                                "darkred",
                                "grey20",
                                "orchid4",
                                "palegreen4"))+
  scale_y_continuous(breaks = c(0.0, 0.25, 0.50, 0.75, 1.00))+
  coord_cartesian(ylim = c(0.0, 1.00))+
  labs(title = "Energy by Key (Taylor Swift)",
       y = "Energy",
       x = "Key", 
       color = "Album")+ 
  #annotate(geom = "label", x = "A#", y = 0, label = "Low")+ 
  #annotate(geom = "label", x = "A#", y = 1, label = "High")+ 
  theme_linedraw(base_size = 12)+ 
  theme(legend.position = "right", axis.text.x = element_text(angle = 90))


ggplotly(ts_graph, tooltip = "text")


## bach --------------------------------------------------------------------

bach_audio_clean <- readRDS("data/bach_clean_audio.rds") # D
bach_audio <- readRDS("data/bach_audio.rds") # D

bach_graph <- bach_audio_clean %>%  
  ggplot(mapping = aes(x = key_mode, 
                       y = energy, 
                       color = album_name, 
                       text = track_name))+ 
  geom_hline(yintercept = 0.5)+
  geom_point(size = 2, alpha = 0.75) + 
  scale_color_manual(values = c("#dbac00",
                                "#3e8996",
                                "#913e96",
                                "#de81a0"))+ 
  scale_y_continuous(breaks = c(0.0, 0.25, 0.50, 0.75, 1.00)) + 
  coord_cartesian(ylim = c(0.0, 1.00))+ 
  theme_linedraw(base_size = 12)+
  theme(axis.text.x = element_text(angle = 90), legend.position = "bottom")+ 
  labs(title = "Energy by Key (J. S. Bach)", 
       x = "Key", 
       y = "Energy",
       color = "Album")

ggplotly(bach_graph, tooltip = "text")


