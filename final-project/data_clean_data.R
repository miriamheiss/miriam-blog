# You don't need to run this, it takes a long time to get from spotify

library(spotifyr)
library(tidyverse)

ts_id <- readRDS("data/ts_id.rds")
bach_id <- readRDS("data/bach_id.rds")

# taylor_swift_raw <- get_artist_albums(ts_id)
# saveRDS(taylor_swift_raw, "data/ts_albums.rds")
ts_albums_raw <- readRDS("data/ts_albums.rds")

# ts_audio_raw <- get_artist_audio_features(ts_id)
# saveRDS(ts_audio_raw, "data/ts_audio.rds")
ts_audio_raw <- readRDS("data/ts_audio.rds")

#bach_albums_raw <- get_artist_albums(bach_id)
#saveRDS(bach_albums_raw, "data/bach_albums_raw.rds")
bach_albums_raw <- readRDS("data/bach_albums_clean.rds")

# bach_audio_raw <- get_artist_audio_features(bach_id)
# saveRDS(bach_audio_raw, "data/bach_audio.rds")
bach_audio_raw <- readRDS("data/bach_audio.rds")

albums <- c("evermore (deluxe version)",
            "folklore (deluxe version)",
            "Lover",
            "reputation",
            "1989",
            "Red (Taylor's Version)",
            "Speak Now",
            "Fearless (Taylor's Version)",
            "Taylor Swift")

bach_albums_clean <- c("J. S. Bach: Cantatas", 
                 "Invention", 
                 "Bach on Porthan Organ",
                 "Innovations: Bach")

write_rds(bach_albums_clean, "data/bach_albums_clean.rds")
write_rds(albums, "data/ts_albums_clean.rds")