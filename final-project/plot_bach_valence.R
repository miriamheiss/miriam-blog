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
