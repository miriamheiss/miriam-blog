library(tidyverse)

#results <- search_spotify("J. S. Bach", type = "artist")
bach_id <- "5aIqB5nVVvmFsvSdExz408"

write_rds(bach_id, "data/bach_id.rds")

# Find TS spotify id
# results <- search_spotify("Taylor Swift", type = "artist")
ts_id <- "06HL4z0CvFAxyc27GXpf02"

write_rds(ts_id, "data/ts_id.rds")
