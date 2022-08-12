bach_albums_clean <- read_rds("bach_albums.rds") 
ts_albums_clean <- read_rds("ts_albums.rds") 

bach_cleaned <- bach_audio_raw %>% 
  filter(album_name %in% bach_albums_clean) %>% 
  select(key_mode, track_name, energy, album_name, 
         duration_ms, time_signature, tempo, valence)

write_rds(bach_cleaned, "bach_clean_audio.rds")


ts_audio_clean <-  ts_audio_raw %>% 
  filter(album_name %in% ts_albums_clean) %>% 
  select(track_name, energy, key_mode, album_name, 
         duration_ms, time_signature, tempo, valence)

write_rds(ts_audio_clean, "ts_clean_audio.rds")
 