# Loads libraries and data
source("load.R")


# Scatter Plot
# g <- ggplot(times) +
#   geom_point(aes(total_t, day), shape = 1) +
#   theme_bw()
# print(g)


# Scatter Plot
# g <- ggplot(times) +
#   geom_point(aes(total_t, my), shape = 1) +
#   theme_bw()
# print(g)


# Scatter Plot
# g <- ggplot(times, aes(x = date, y = total_t, colour = my)) +
#   geom_point(size = 2) +
#   theme_bw() +
#   # scale_colour_brewer(palette = "Set1") +
#   theme(legend.position = "none") +
#   theme(panel.background = element_rect(colour = "grey")) +
#   theme(panel.grid.minor = element_line(colour = NA)) +
#   theme(panel.grid.major = element_line(colour = NA))
# print(g)


# Point with jitter
# g <- ggplot(times, aes(factor(day), total_t)) +
#   geom_point(position = position_jitter(width = 0.05), alpha = 0.6, shape = 1) +
#   theme_bw() +
#   xlab("Magnitude (Richter)") +
#   ylab("Depth (km)")
# print(g)


# Faceted scatterplot plot with all points in the background of each plot.
# g <- ggplot(times, aes(date, total_t)) +
#   geom_point(data = transform(times, day = NULL), colour = "grey92") +
#   geom_point() +
#   facet_grid(~day) +
#   theme_bw()
# print(g)
