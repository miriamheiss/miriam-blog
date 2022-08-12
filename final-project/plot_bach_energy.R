bach_graph <- bach_audio_clean %>%  
  ggplot(mapping = aes(x = key_mode, 
                       y = energy, 
                       color = album_name, 
                       text = track_name))+ 
  geom_hline(yintercept = 0.5)+
  geom_point(size = 2.5, alpha = 0.75) + 
  scale_color_manual(values = c("lightpink3",
                                "paleturquoise4",
                                "thistle4"))+ 
  scale_y_continuous(breaks = c(0.0, 0.25, 0.50, 0.75, 1.00)) + 
  coord_cartesian(ylim = c(0.0, 1.00))+ 
  theme_linedraw(base_size = 10)+
  theme(axis.text.x = element_text(angle = 90), legend.position = "right")+ 
  labs(title = "Energy by Key (J. S. Bach)", 
       x = "Key", 
       y = "Energy",
       color = "Album")+ 
  annotate(geom = "label", x = "A# minor", y = 0, label = "Low")+ 
  annotate(geom = "label", x = "A# minor", y = 1, label = "High")

write_rds(bach_graph, "bach_energy_plot.rds")
