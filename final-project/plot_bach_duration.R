bach_duration <- bach_audio %>% 
  filter(album_name %in% bach_albums_clean) %>%
  mutate(minutes = duration_ms / 1000 / 60) %>% 
  ggplot(mapping = aes(y = minutes,
                       x = album_name,
                       color = album_name))+
  geom_hline(yintercept = 5)+
  geom_hline(yintercept = 3)+
  geom_point()+
  scale_color_manual(values = c("lightpink3",
                                "paleturquoise4",
                                "thistle4"))+
  scale_y_continuous(breaks = c(1, 3, 2, 4, 5, 6, 7, 8, 9, 10)) + 
  coord_cartesian(ylim = c(1, 10)) + 
  theme_linedraw(base_size = 12)+ 
  theme(legend.position = "none")+ 
  labs(title = "Play Time (Bach) in minutes",
       subtitle = "Most songs under five minutes are on the\nshorter side",
       y = "Length (Minutes)",
       x = NULL)

write_rds(bach_duration, "bach_length_plot.rds")
bach_duration
