bach_tempo <- bach_audio_clean %>%
  ggplot(mapping = aes(x = tempo,
                       y = valence))+ 
  coord_cartesian(ylim = c(0.0, 1))+
  geom_point(aes(color = album_name), size = 2.5)+ 
  geom_smooth(se = FALSE, method = "loess", formula = y~x, color = "black")+
  theme_linedraw(base_size = 12)+
  theme(legend.position = "bottom")+
  scale_color_manual(values = c("lightpink3",
                                "paleturquoise4",
                                "thistle4"), 
                     guide = guide_legend(ncol = 2, 
                                          title.position = "top"))+ 
  labs(title = "Valence by Tempo (J. S. Bach)",
       x = "Tempo",
       y = "Valence",
       color = "Album") +
  scale_y_continuous(expand = c(0, 0))

write_rds(bach_tempo, "bach_tempo_plot.rds")
