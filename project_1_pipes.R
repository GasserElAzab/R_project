library(tidyverse)

# Load data
trade_2018_per_quarter <- read_csv("trade.csv")

# Total import/export
trade_2018 <- trade_2018_per_quarter %>% mutate(
  import = import_q1 + import_q2 + import_q3 + import_q4,
  export = export_q1 + export_q2 + export_q3 + export_q4) %>%
  select(region, export, import)

# trade differentials, deficits
trade_2018 <- trade_2018 %>% mutate(
  differential = export - import,
  deficit = ifelse(export < import,"deficit","surplus"))

# summarise
trade_2018 %>% group_by(deficit) %>%
  summarise(n = n(),
            mean_differential = mean(differential))