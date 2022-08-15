bach_albums <- read_rds("data/bach_albums_clean.rds") 
ts_albums <- read_rds("data/ts_albums_clean.rds") 

bach_cleaned <- bach_audio_raw %>% 
  filter(album_name %in% bach_albums_clean) %>% 
  select(key_mode, track_name, energy, album_name, 
         duration_ms, time_signature, tempo, valence)


ts_cleaned <-  ts_audio_raw %>% 
  filter(album_name %in% ts_albums) %>% 
  select(track_name, energy, key_mode, album_name, 
         duration_ms, time_signature, tempo, valence)

write_rds(ts_cleaned, "data/ts_clean_audio.rds")
write_rds(bach_cleaned, "data/bach_clean_audio.rds") 