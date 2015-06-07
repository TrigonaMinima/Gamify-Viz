# Loads libraries and data
source("load.R")


# Loess Analysis
g <- ggplot(times, aes(date, total_t)) +
  geom_point() +
  geom_smooth(method = "loess", size = 1.5) +
  theme_bw()
print(g)


# Loess Analysis
g <- ggplot(times, aes(date, total_t)) +
  geom_point() +
  geom_smooth(method = "loess", se = F) +
  # geom_rug() +
  theme_bw() +
  facet_grid(~day) +
  xlab("Coursework score") +
  ylab("Written exam score")
print(g)