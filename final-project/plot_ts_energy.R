ts_graph<- ggplot(data = ts_audio_clean,
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

#ggplotly(ts_graph, tooltip = "text") this is optional for final project lol

write_rds(ts_graph, "~/Documents/Projects/miriam-blog/final-project/ts_energy_plot.rds")

