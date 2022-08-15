bach_duration <- bach_cleaned %>% 
  filter(album_name %in% bach_albums) %>%
  mutate(minutes = duration_ms / 1000 / 60) %>% 
  ggplot(mapping = aes(y = minutes,
                       x = album_name,
                       color = album_name))+
  geom_hline(yintercept = 5)+
  geom_hline(yintercept = 3)+
  geom_point()+
  scale_color_manual(values = c("lightpink3",
                                "paleturquoise4",
                                "thistle4",
                                "#a8325a"))+
  scale_y_continuous(breaks = c(1, 3, 2, 4, 5, 6, 7, 8, 9, 10)) + 
  coord_cartesian(ylim = c(1, 10)) + 
  theme_linedraw(base_size = 12)+ 
  theme(legend.position = "none", axis.text.x = element_text(angle = 90))+ 
  labs(title = "Play Time (Bach) in minutes",
       subtitle = "Most pieces are between 1 and 3 minutes",
       y = "Length (Minutes)",
       x = NULL,
       caption = "Source: Spotify")

write_rds(bach_duration, "data/bach_length_plot.rds")

