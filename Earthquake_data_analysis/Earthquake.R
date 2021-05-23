library(tidyverse)


# Load data
quakes <- read_csv(file = "Earthquake_data_analysis/earthquakes.csv")

# Filter out explosions
quakes <- quakes %>%
  filter(type == "Earthquake")

# Scatterplot depth vs magnitude
ggplot(data = quakes) +
  aes(x = depth,
      y = magnitude) + 
  geom_point() +
  labs(x = "Depth (m)",
       y = "Magnitude (Richter scale)")

# summary magnitudes
magnitudes <- quakes %>%
  mutate(magnitude_rounded = round(magnitude)) %>%
  group_by(magnitude_rounded) %>%
  summarise(n_quakes = n())

# Bar plot magnitudes
quakes %>%
  mutate(magnitude_rounded = round(magnitude)) %>%
  ggplot() +
  aes(x = magnitude_rounded) +
  geom_bar(stat = "count") +
  labs(x = "Magnitude (Richter scale)",
       y = "Number of quakes")