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

