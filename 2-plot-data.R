library(ggplot2)

colour_hillcrest = "blue"
colour_maritzburg = "green"

marathon_colours <- c(colour_hillcrest, colour_maritzburg)

# NOTE: The 2010 Hillcrest Marathon has a 5 hour cutoff, so these data are effectively censored.

ggplot(marathons, aes(x = time / 60)) +
  geom_density(aes(fill = race), alpha = 0.5) +
  facet_wrap(~ year) +
  scale_fill_manual(values = marathon_colours) +
  labs(x = "Hours", y = "Count") +
  scale_x_continuous(limits = c(2, 6.5)) +
  theme_minimal() + theme(legend.position = "none")

ggplot(marathons, aes(x = time / 60, fill = race)) +
  geom_density(alpha = 0.5) +
  scale_fill_manual(values = marathon_colours) +
  labs(x = "Hours", y = "Density") +
  theme_minimal()

ggplot(marathons, aes(x = race, y = time / 60)) +
  geom_boxplot(aes(fill = race)) +
  facet_wrap(~ year) +
  scale_fill_manual(values = marathon_colours) +
  labs(x = "", y = "Hours") +
  theme_minimal() + theme(legend.position = "none")

ggplot(merged, aes(x = difference)) +
  # geom_histogram(bins = 50, fill = "grey", colour = "black") +
  geom_density(fill = "grey", alpha = 0.5) +
  labs(x = "Maritzburg - Hillcrest [Minutes]", y = "Density") +
  scale_x_continuous(limits = c(-75, 75), breaks = seq(-75, 75, 25)) +
  facet_wrap(~ year) +
  theme_minimal()
