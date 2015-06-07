# The plots which looks different but aren't really useful.

# Loads libraries and data
source("load.R")


# Area under the curve or between 2 lines
g <- ggplot(times, aes(x = date, y = total_t, ymin = 0, ymax = total_t)) +
  geom_ribbon(aes(colour = my))
print(g)


# Area under the curve or between 2 lines
g <- ggplot(times, aes(x = date, y = total_t, ymin = 0, ymax = total_t)) +
  geom_ribbon()
print(g)


# Dont know wtf this is.
# https://learnr.wordpress.com/2009/08/10/ggplot2-version-of-figures-in-lattice-multivariate-data-visualization-with-r-part-9/
g <- ggplot(times, aes(x = day, y = date, fill = total_t)) +
  geom_tile() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, colour = "grey50")) +
  theme(aspect.ratio = 50 / 5)
print(g)


# Panel Chart
g <- ggplot(times, aes(x = date, y = total_t)) +
  geom_point() +
  geom_line() +
  geom_smooth(method = "lm", se = FALSE, fullrange = T) +
  facet_wrap(~day, ncol = 1) +
  labs(x = "Date", y = "Total Time") +
  theme_bw() +
  facet_wrap(~day, ncol = 1, scales = "free") +
  coord_equal()
print(g)


# Box Plot
g <- ggplot(times, aes(factor(day), total_t)) +
  geom_boxplot() + coord_flip() + ylab("Average time spent sleeping")
print(g)


# Ribbon Plot
g <- ggplot(times, aes(total_t)) +
  geom_ribbon(aes(ymax = ..density.., ymin = -..density..), stat = "density") +
  # facet_grid(day ~ ., as.table = F, scales = "free_y") +
  labs(x = "Time spent sleeping", y = "Days")
print(g)


# Kernel Density Plot
g <- ggplot(times, aes(total_t)) +
  stat_density(geom = "path",
    kernel = "rect",
    position = "identity",
    bw = 0.2) +
  geom_rug()
print(g)
