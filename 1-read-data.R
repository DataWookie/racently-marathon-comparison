library(readr)
library(dplyr)

marathons <- read_tsv("marathon-data.tsv", col_types = "cicc")

marathons <- rename(marathons, athlete = athlete_id, race = name) %>%
  mutate(
    # time -> decimal minutes
    time = as.integer(sub("000000$", "", time)) / 60,
    #
    race = factor(sub(" Marathon$", "", race)),
    athlete = factor(athlete)
  )

hillcrest = filter(marathons, race == "Hillcrest") %>% select(-race)
maritzburg = filter(marathons, race == "Maritzburg") %>% select(-race)

merged = merge(hillcrest, maritzburg, by = c("year", "athlete")) %>%
  rename(hillcrest = time.x, maritzburg = time.y) %>%
  mutate(difference = maritzburg - hillcrest)

# # Exclude 2010 data because it had a different cutoff time.
# #
# comparable_marathons = subset(marathons, year != 2010)
# 
# hillcrest = filter(comparable_marathons, race == "Hillcrest") %>% select(-race)
# maritzburg = filter(comparable_marathons, race == "Maritzburg") %>% select(-race)