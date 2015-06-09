# Loads libraries and data
source("load.R")


# A plot with each bar showing the amount of time I slept on a
# stretch on each day.
#
# with colours replace with this line -
# g <- ggplot(times, aes(x = as.POSIXct(date), colour = colour))
g <- ggplot(times, aes(x = as.POSIXct(date))) +
  geom_segment(aes(y = ts1,
    x = as.POSIXct(date),
    xend = as.POSIXct(date),
    yend = te1,
    linetype = "h")) +
  geom_segment(aes(y = ts2,
    x = as.POSIXct(date),
    xend = as.POSIXct(date),
    yend = te2,
    linetype = "h")) +
  geom_segment(aes(y = ts3,
    x = as.POSIXct(date),
    xend = as.POSIXct(date),
    yend = te3,
    linetype = "h")) +
  geom_segment(aes(y = ts4,
    x = as.POSIXct(date),
    xend = as.POSIXct(date),
    yend = te4,
    linetype = "h")) +
  geom_segment(aes(y = ts5,
    x = as.POSIXct(date),
    xend = as.POSIXct(date),
    yend = te5,
    linetype = "h")) +
  theme_bw() +
  scale_y_datetime(breaks = ("2 hour"),
    # minor_breaks = ("30 min"),
    labels = date_format("%H:%M")) +
  # scale_x_datetime(breaks = date_breaks("1 week"),
  #   labels = date_format("%d %b '%y")) +
  scale_x_datetime(labels = date_format("%b '%y")) +
  xlab("") +
  ylab("") +
  ggtitle("Amount of sleep I had on each day") +
  theme(legend.position = "none")
  # theme(axis.text.x = element_text(angle=45, vjust=0.5),
  #   legend.position = "none")
print(g)
