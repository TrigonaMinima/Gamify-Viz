# Loads libraries and data
source("load.R")

# Some variables plot
avg <- mean(times$total_t)
yu <- avg + 0.6
yl <- avg - 0.6
label <- paste(round(avg,2), "Hours")


# Time series plot.
# Baseline: hours
g <- ggplot(times, aes(x = date, y = total_t)) +
  geom_line(colour = "grey70") +
  geom_hline(y = 24, color = "grey70") +
  geom_point(colour = "grey50", size = 0.7) +
  geom_hline(y = avg,
    position = "identity",
    stat = "hline",
    colour = "grey50") +
  theme_bw() +
  scale_x_date(breaks = date_breaks("1 week"),
    labels = date_format("%d %b '%y")) +
  xlab("") + ylab("Hours spent sleeping") +
  geom_text(aes(label = "Current Average",
    x = date[1] - 8,
    y = yu,
    size = 5),
    colour = "grey60") +
  geom_text(aes(label = label,
    x = date[1] - 8,
    y = yl,
    size = 5),
    colour = "grey60") +
  geom_text(aes(label = "24 Hours",
    x = date[1] - 9,
    y = 24.6,
    size = 5),
    colour = "grey60") +
  theme(axis.text.x = element_text(angle=45, vjust=0.5),
    legend.position = "none")
print(g)


# Cumulative time series
# g <- ggplot(times, aes(x = date)) +
#   geom_line(aes(y = cumsum(times$total_t))) +
#   geom_line(aes(y = cumsum(rep(rep(24, length(times$date))))))
# print(g)


# time series with
# g <- ggplot(times, aes(x = times$total_t, y = 24)) +
#   geom_point()
# print(g)
