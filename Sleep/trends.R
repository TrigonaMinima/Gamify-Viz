# Loads libraries and data
source("load.R")


# Overall Trend
g1 <- ggplot(times, aes(x = date, y = total_t)) +
  geom_line(colour = "grey70") +
  geom_point(colour = "grey50", size = 0.7) +
  geom_smooth(method = lm, se = F, colour = "grey55") +
  theme_bw() +
  scale_x_date(labels = date_format("%b '%y")) +
  # scale_x_date(breaks = date_breaks("1 week"),
  #   labels = date_format("%d %b '%y")) +
  xlab("") + ylab("Hours spent sleeping") +
  ggtitle("Overall linear trend") +
  theme(legend.position = "none")
  # theme(axis.text.x = element_text(angle=45, vjust=0.5),
  #   legend.position = "none")
print(g1)


# Monthly Trend
# Can be made better
# https://learnr.wordpress.com/2009/07/12/ggplot2-decadal-trend-rates-in-global-temperature/
# Display rates
# vlines <- aggregate(times$date, by = list(times$my), max)$x

g <- ggplot(times, aes(x = date, y = total_t)) +
  geom_line(colour = "grey70") +
  geom_point(colour = "grey50", size = 0.7) +
  geom_smooth(method = lm, se = F, colour = "green") +
  geom_smooth(aes(group = my, colour = my), method = lm, se = F) +
  # geom_vline(x = as.numeric(sort(vlines, decreasing = T)[-1]),
  #   linetype = 3,
  #   colour = "grey50") +
  theme_bw() +
  scale_x_date(labels = date_format("%b '%y")) +
  # scale_x_date(breaks = date_breaks("1 week"),
  #   labels = date_format("%d %b '%y")) +
  xlab("") + ylab("Hours spent sleeping") +
  scale_colour_hue(c = 70, l = 30) +
  ggtitle("Overall linear trend overlapped with monthly linear trend") +
  theme(legend.position = "none",
    panel.grid.major.x = element_line(colour = "grey50", linetype = 1))
  # theme(axis.text.x = element_text(angle=45, vjust=0.5),
  #   legend.position = "none")
print(g)


# Loess Trend Overall
g <- ggplot(times, aes(x = date, y = total_t)) +
  geom_line(colour = "grey70") +
  geom_point(colour = "grey50", size = 0.9) +
  geom_smooth(method = "loess", colour = "grey55") +
  scale_x_date(breaks = date_breaks("1 week"),
    labels = date_format("%d %b '%y")) +
  xlab("") + ylab("Hours spent sleeping") +
  ggtitle("Overall loess trend") +
  theme(axis.text.x = element_text(angle=45, vjust=0.5),
    legend.position = "none") +
  theme_bw()
print(g)


# Monthly trend compared to overall loess trend
g <- ggplot(times, aes(x = date, y = total_t)) +
  geom_line(colour = "grey70") +
  geom_point(colour = "grey50", size = 0.7) +
  geom_smooth(method = "loess", colour = "green") +
  geom_smooth(aes(group = my, colour = my), method = lm, se = F) +
  theme_bw() +
  scale_x_date(labels = date_format("%b '%y")) +
  # scale_x_date(breaks = date_breaks("1 week"),
  #   labels = date_format("%d %b '%y")) +
  xlab("") + ylab("Hours spent sleeping") +
  scale_colour_hue(c = 70, l = 30) +
  ggtitle("Overall loess trend overlapped with monthly linear trend") +
  theme(legend.position = "none",
    panel.grid.major.x = element_line(colour = "grey50", linetype = 1))
  # theme(axis.text.x = element_text(angle=45, vjust=0.5),
  #   legend.position = "none")
print(g)


# Loess Analysis for each day of the week.
# g <- ggplot(times, aes(date, total_t)) +
#   geom_point() +
#   geom_smooth(method = "loess", se = F) +
#   # geom_rug() +
#   theme_bw() +
#   facet_grid(~day) +
#   xlab("Coursework score") +
#   ylab("Written exam score")
# print(g)


# Loess analysis on the data points
# g <- ggplot(times, aes(date, total_t)) +
#   geom_point() +
#   geom_smooth(method = "loess", size = 1.5) +
#   theme_bw()
# print(g)
