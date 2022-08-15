ts_duration <- ts_cleaned %>% 
  filter(album_name %in% ts_albums) %>% 
  select(duration_ms, album_name) %>% 
  mutate(minutes = duration_ms / 1000 / 60) %>% 
  ggplot(mapping = aes(y = minutes,
                       x = album_name,
                       color = album_name))+ 
  geom_hline(yintercept = 5)+
  geom_hline(yintercept = 3)+
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
  theme(axis.text.x = element_text(angle = 90), legend.position = "none")+ 
  labs(title = "Play Time (Taylor Swift) in minutes",
       subtitle = "Most songs are between 3 and 5 minutes",
       y = "Length (Minutes)",
       x = NULL)

write_rds(ts_duration, "data/ts_length_plot.rds")
ts_duration
