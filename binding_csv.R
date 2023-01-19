library(tidyverse)

sequence_dates <- seq(1955, 2019, 1)

tableausortie <- tibble(rank = numeric(), company = character(), revenue=numeric(), date = numeric())

for (i in 1:length(x = sequence_dates)) {
  lecture <- read.csv(file = paste0("csv/fortune500-", sequence_dates[i], ".csv")) %>%
    as_tibble() %>%
    rename(revenue=revenue....millions.)
  lecture <- lecture[,1:3]
  lecture <- lecture %>%
    mutate(date = sequence_dates[i])
  tableausortie <- tableausortie %>%
    bind_rows(lecture)
}

tableausortie

write.csv(x = tableausortie %>%
            select(company) %>%
            unique(), file = "fortune500_1955_2019_uniquenames.csv", row.names = FALSE)

