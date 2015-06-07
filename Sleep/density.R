# Loads libraries and data
source("load.R")


# Density Plot.
g <- ggplot(times, aes(total_t)) +
  stat_density(geom = "path", position = "identity")
print(g)

# Density Plot for each day of the week.
g <- ggplot(times, aes(total_t)) +
  stat_density(geom = "path", position = "identity") +
  theme_bw() +
  facet_wrap(~ day, ncol = 7)
print(g)

# Density Plot for each day of the week.
g <- ggplot(times, aes(total_t)) +
  stat_density(geom="path", position="identity", aes(colour = factor(day)))
print(g)

# density plot + Histogram
g <- ggplot(times, aes(total_t)) +
  stat_density(geom="path", position="identity") +
  geom_point(aes(y = 0.0),
    position = position_jitter(height = 0.000),
    alpha = 0.25)
print(g)
