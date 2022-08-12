# You don't need to run this, it takes a long time to get from spotify

library(spotifyr)
library(tidyverse)

#taylor_swift_raw <- get_artist_albums(ts_id)
#saveRDS(taylor_swift_raw, "ts_albums.rds")
ts_albums_raw <- readRDS("ts_albums.rds")

#ts_audio_raw <- get_artist_audio_features(ts_id)
#saveRDS(ts_audio_raw, "ts_audio.rds")
ts_audio_raw <- readRDS("ts_audio.rds")

#bach_audio_raw <- get_artist_audio_features(bach_id)
#saveRDS(bach_audio_raw, "bach_audio.rds")
bach_audio_raw <- readRDS("bach_audio.rds")

albums <- c("evermore (deluxe version)",
            "folklore (deluxe version)",
            "Lover",
            "reputation",
            "1989",
            "Red (Taylor's Version)",
            "Speak Now",
            "Fearless (Taylor's Version)",
            "Taylor Swift")

write_rds(albums, "tsalbums.rds")


bach_albums <- c("J. S. Bach: Cantatas", 
                 "Invention", 
                 "Bach on Porthan Organ")

write_rds(bach_albums, "bachalbums.rds")

