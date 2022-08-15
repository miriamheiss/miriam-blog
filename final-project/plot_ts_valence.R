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

