# Loads libraries and data
source("load.R")


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
  # scale_x_date(breaks = date_breaks("1 week"),
  #   labels = date_format("%d %b '%y")) +
  scale_x_date(labels = date_format("%b '%y")) +
  xlab("") +
  ylab("Hours spent sleeping") +
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
  theme_bw() +
  ggtitle("Sleeping pattern") +
  theme(legend.position = "none")
  # theme(axis.text.x = element_text(angle=45, vjust=0.5),
  #   legend.position = "none")
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


# Average hours spent sleeping per day
g <- ggplot(times, aes(x = date, y = avg_t)) +
  geom_line(colour = "grey70") +
  geom_point(colour = "grey50", size = 0.9) +
  xlab("") +
  ylab("Average hours") +
  scale_x_date(labels = date_format("%b '%y")) +
  ggtitle("Average hours spent sleeping per day") +
  theme(plot.title = element_text(lineheight = .8, face = "bold")) +
  theme_bw()
print(g)


# Average hours spent sleeping per day with a hline at 7 hours.
g <- ggplot(times, aes(x = date, y = avg_t)) +
  geom_line(colour = "grey70") +
  geom_point(colour = "grey50", size = 0.9) +
  geom_hline(y = 7, color = "grey70") +
  xlab("") +
  ylab("Average hours") +
  scale_x_date(labels = date_format("%b '%y")) +
  ggtitle("Average hours spent sleeping per day") +
  theme(plot.title = element_text(lineheight = .8, face = "bold")) +
  theme_bw()
print(g)


# Upper plot without line
g <- ggplot(times, aes(x = date, y = avg_t)) +
  geom_point() +
  xlab("") +
  ylab("Average hours spent sleeping") +
  scale_x_date(labels = date_format("%b '%y")) +
  ggtitle("Average hours spent sleeping per day") +
  theme_bw()
print(g)


# Panel plot with time series and average hours spent sleeping.
# followed this
# https://learnr.wordpress.com/2009/05/01/ggplot2-dont-try-this-with-excel-revised/

dummy <- data.frame(date = rep(times$date, 2),
  time = c(times$total_t, times$avg_t),
  id = c(rep("Time Series Plot", length(times$date)),
    rep("Average Hours Slept", length(times$date))))


p <- ggplot(dummy, aes(x = date, y = time)) +
  # ylim(0, 20) +
  facet_grid(id ~ .) +
  xlab(NULL) +
  ylab(NULL) +
  scale_x_date(labels = date_format("%b '%y")) +
  theme_bw() +
  theme(legend.position = "none",
    panel.margin = unit(0, "lines"),
    panel.grid.major = element_blank()) +
  geom_blank()


df1 <- data.frame(subset(times, select = c("date", "avg_t")),
  id  = levels(dummy$id)[1])
colnames(df1)[colnames(df1) == "avg_t"] <- "time"


# Average hours spent sleeping per day with a hline at 7 hours.
g1 <- p + geom_line(data = df1, colour = "grey70") +
  geom_point(data = df1, colour = "grey50", size = 0.9) +
  geom_hline(y = 7, color = "grey70")
print(g1)


df2 <- data.frame(subset(times, select = c("date", "total_t")),
  id  = levels(dummy$id)[2])
colnames(df2)[colnames(df2) == "total_t"] <- "time"


# time series
g2 <- g1 + geom_line(data = df2, colour = "grey70") +
  geom_point(data = df2, colour = "grey50", size = 0.7) +
  geom_hline(y = avg,
    position = "identity",
    stat = "hline",
    colour = "grey50")
