# Loads libraries and data
source("load.R")


# Overall Trend
g1 <- ggplot(times, aes(x = date, y = total_t)) +
  geom_line(colour = "grey70") +
  geom_point(colour = "grey50", size = 0.7) +
  geom_smooth(method = lm, se = F, colour = "grey55") +
  theme_bw() +
  scale_x_date(breaks = date_breaks("1 week"),
    labels = date_format("%d %b '%y")) +
  xlab("") + ylab("Hours spent sleeping") +
  theme(axis.text.x = element_text(angle=45, vjust=0.5),
    legend.position = "none")
print(g1)


# Monthly Trend
# Can be made better
# https://learnr.wordpress.com/2009/07/12/ggplot2-decadal-trend-rates-in-global-temperature/
# Display rates
vlines <- aggregate(times$date, by = list(times$my), max)$x

g <- ggplot(times, aes(x = date, y = total_t)) +
  geom_line(colour = "grey70") +
  geom_point(colour = "grey50", size = 0.7) +
  geom_smooth(method = lm, se = F, colour = "green") +
  geom_smooth(aes(group = my, colour = my), method = lm, se = F) +
  geom_vline(x = as.numeric(sort(vlines, decreasing = T)[-1]),
    linetype = 3,
    colour = "grey50") +
  theme_bw() +
  scale_x_date(breaks = date_breaks("1 week"),
    labels = date_format("%d %b '%y")) +
  xlab("") + ylab("Hours spent sleeping") +
  scale_colour_hue(c = 70, l = 30) +
  theme(axis.text.x = element_text(angle=45, vjust=0.5),
    legend.position = "none")
print(g)

# Monthly Trend
# g <- ggplot(times, aes(x = date, y = total_t)) +
#   geom_line() +
#   geom_smooth(method = lm, se = F, colour = "green") +
#   geom_smooth(aes(group = factor(my), colour = times$my), method = lm, se = F)
# print(g)
