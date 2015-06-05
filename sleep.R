# Various visualizations out of my daily sleep times.
# following this - https://learnr.wordpress.com/

# Libraries
library(ggplot2)
library(scales)
library(reshape2)

# Load data.
times <- read.csv("Data/sleep_times.csv", stringsAsFactors=FALSE)

# Date to R's "date" format.
times$date <- as.Date(times$date, "%d-%m-%Y")

# Adding day corresponding to the date.
times$day <- substr(x=weekdays(times$date), start=1, stop=3)

# Adding month-year for a corresponding date
times$my <- paste(format(times$date, "%b"),
  substr(times$date, start = 3, stop = 4),
  sep = "")

# Total time in hours (2:30 hrs -> 2.5 hrs)
times$total_t <- as.integer(substr(x=times$total, start=1, stop=2)) +
  (as.integer(substr(x=times$total, start=4, stop=5)) / 60)

# Rounded total time.
times$total_round <- round(times$total_t)


times$ts1 <- strptime(times$ts1, format = "%I:%M %p")
times$te1 <- strptime(times$te1, format = "%I:%M %p")
times$ts2 <- strptime(times$ts2, format = "%I:%M %p")
times$te2 <- strptime(times$te2, format = "%I:%M %p")
times$ts3 <- strptime(times$ts3, format = "%I:%M %p")
times$te3 <- strptime(times$te3, format = "%I:%M %p")
times$ts4 <- strptime(times$ts4, format = "%I:%M %p")
times$te4 <- strptime(times$te4, format = "%I:%M %p")
times$ts5 <- strptime(times$ts5, format = "%I:%M %p")
times$te5 <- strptime(times$te5, format = "%I:%M %p")


# Each line bar represents the amount of time I slept.
g <- ggplot(times, aes(x = as.POSIXct(date))) +
  geom_segment(aes(y = ts1,
    x = as.POSIXct(date),
    xend = as.POSIXct(date),
    yend = te1,
    linetype = "h")) +
  geom_segment(aes(y = ts2,
    x = as.POSIXct(date),
    xend = as.POSIXct(date),
    yend = te2)) +
  geom_segment(aes(y = ts3,
    x = as.POSIXct(date),
    xend = as.POSIXct(date),
    yend = te3)) +
  geom_segment(aes(y = ts4,
    x = as.POSIXct(date),
    xend = as.POSIXct(date),
    yend = te4)) +
  geom_segment(aes(y = ts5,
    x = as.POSIXct(date),
    xend = as.POSIXct(date),
    yend = te5)) +
  scale_y_datetime(breaks = ("2 hour"),
    minor_breaks = ("30 min"),
    labels = date_format("%H:%M")) +
  scale_x_datetime(breaks = date_breaks("1 week"),
    labels = date_format("%d %b '%y")) +
  xlab("") + ylab("24 Hours") +
  theme(axis.text.x = element_text(angle=45, vjust=0.5),
    legend.position = "none")
print(g)



# Time series plot.
# Baseline: hours
g <- ggplot(times, aes(x = date, y = total_t)) +
  geom_line() +
  scale_x_date(breaks = date_breaks("1 week"),
    labels = date_format("%d %b '%y")) +
  xlab("") + ylab("Hours spent sleeping") +
  geom_hline(y = 7.0, position = "identity", stat = "hline") +
  theme(axis.text.x = element_text(angle=45, vjust=0.5))
print(g)


# Overall Trend
g <- ggplot(times, aes(x = date, y = total_t)) +
  geom_line() +
  geom_smooth(method = lm, se = F, colour = "red") +
  scale_x_date(breaks = date_breaks("1 week"),
    labels = date_format("%d %b '%y")) +
  xlab("") + ylab("Hours spent sleeping") +
  theme(axis.text.x = element_text(angle=45, vjust=0.5))
print(g)




# Monthly Trend
# Can be made better
# https://learnr.wordpress.com/2009/07/12/ggplot2-decadal-trend-rates-in-global-temperature/
g <- ggplot(times, aes(x = date, y = total_t)) +
  geom_line() +
  geom_smooth(method = lm, se = F, colour = "red") +
  geom_smooth(aes(group = my, colour = my), method = lm, se = F) +
  scale_x_date(breaks = date_breaks("1 week"),
    labels = date_format("%d %b '%y")) +
  xlab("") + ylab("Hours spent sleeping") +
  theme(legend.position = "none",
    axis.text.x = element_text(angle=45, vjust=0.5))
print(g)

# # Daily Trend
# Make daily data nad use it
# g <- ggplot(times, aes(x = date, y = total_t)) +
#   geom_line() +
#   geom_smooth(method = lm, se = F, colour = "green") +
#   geom_smooth(aes(group = factor(my), colour = times$my), method = lm, se = F)
# print(g)

# Monthly Trend
g <- ggplot(times, aes(x = date, y = total_t)) +
  geom_line() +
  geom_smooth(method = lm, se = F, colour = "green") +
  geom_smooth(aes(group = factor(my), colour = times$my), method = lm, se = F) +
  facet_wrap(~day, scales = "free")
print(g)


# Cumulative time series
g <- ggplot(times, aes(x = date)) +
  geom_line(aes(y = cumsum(times$total_t))) +
  geom_line(aes(y = cumsum(rep(rep(24, length(times$date))))))
print(g)

# time series with
g <- ggplot(times, aes(x = date)) +
  geom_line(aes(y = times$total_t)) +
  geom_hline(y = 24)
print(g)

# time series with
# g <- ggplot(times, aes(x = times$total_t, y = 24)) +
#   geom_point()
# print(g)


# library(grid)
# library(plyr)

# https://learnr.wordpress.com/2009/05/18/ggplot2-three-variable-time-series-panel-chart/

# g <- ggplot(times, aes(date,
#     total_t,
#     # ymin = 0,
#     # ymax = total_t,
#     colour = "grey30")) +
#   scale_colour_identity() +
#   # xlim(1980, 2010) +
#   facet_grid(variable ~ ., scales = "free", as.table = FALSE) +
#   theme_bw()
#   # theme_bw() +
#   # theme(panel.margin = unit(0, "lines"),
#   #   axis.title.x = element_blank(),
#   #   axis.title.y = element_blank())

# g1 <- g + geom_step(subset = .(variable == "day"))
# print(g1)





# Histogram.
g <- ggplot(times, aes(total_t)) +
  geom_histogram(binwidth = 0.2)
print(g)

# Histogram for each day of the week.
g <- ggplot(times, aes(total_t)) +
  geom_histogram(binwidth = 0.2) +
  facet_wrap(~day, ncol = 7)
print(g)

# Density Plot.
g <- ggplot(times, aes(total_t)) +
  stat_density(geom="path", position="identity")
print(g)

# Density Plot for each day of the week.
g <- ggplot(times, aes(total_t)) +
  stat_density(geom="path", position="identity") +
  facet_wrap(~day, ncol = 7)
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

# Kernel Density Plot
g <- ggplot(times, aes(total_t)) +
  stat_density(geom = "path", kernel = "rect", position = "identity", bw = 0.2) +
  geom_rug()
print(g)

# Scatter Plot
g <- ggplot(times) + geom_point(aes(total_t, day), shape = 1)
print(g)

# Faceted scatterplot plot with all points in the background of each plot.
g <- ggplot(times, aes(date, total_t)) +
  geom_point(data = transform(times, day = NULL), colour = "grey92") +
  geom_point() +
  facet_grid(~day) +
  theme_bw()
print(g)

# Scatter Plot
g <- ggplot(times, aes(x = date, y = total_t, colour = my)) +
  geom_point(size = 2)
  # theme(legend.position = "none") +
  # scale_colour_brewer(palette = "Set1") +
  # theme(panel.background = element_rect(colour = "grey")) +
  # theme(panel.grid.minor = element_line(colour = NA)) +
  # theme(panel.grid.major = element_line(colour = NA))
print(g)

# Point with jitter
g <- ggplot(times, aes(factor(day), total_t)) +
  geom_point(position = position_jitter(width = 0.05), alpha = 0.6, shape = 1) +
  theme_bw() +
  xlab("Magnitude (Richter)") +
  ylab("Depth (km)")
print(g)

# Box Plot
g <- ggplot(times, aes(factor(day), total_t)) +
  geom_boxplot() + coord_flip() + ylab("Average time spent sleeping")
print(g)

# Ribbon Plot
g <- ggplot(times, aes(total_t, day)) +
  geom_ribbon(aes(ymax = ..density.., ymin = -..density..), stat = "density") +
  facet_grid(day ~ ., as.table = F, scales = "free_y") +
  labs(x = "Time spent sleeping", y = "Days")
print(g)

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
  geom_rug() +
  facet_grid(~day) +
  xlab("Coursework score") +
  ylab("Written exam score")
print(g)


# A ggplot trick to plot different plot types in facets

# g <- ggplot(times, aes(x = date, y = total_t)) +
#   facet_grid(variable ~ ., scales = "free")
# g1 <- g + geom_step(day ~ .))
# g2 <- g1 + geom_linerange(my ~ .)
# print(g2)


# Panel Chart
g <- ggplot(times, aes(x = date, y = total_t)) +
  geom_point() +
  geom_line() +
  geom_smooth(method = "lm", se = FALSE, fullrange = T) +
  facet_wrap(~day, ncol = 2) +
  labs(x = "Date", y = "Total Time") +
  theme_bw() +
  facet_wrap(~day, ncol = 2, scales = "free") +
  coord_equal()
print(g)

# Dont know wtf this is.
# https://learnr.wordpress.com/2009/08/10/ggplot2-version-of-figures-in-lattice-multivariate-data-visualization-with-r-part-9/
# g <- ggplot(times, aes(x = day, y = date, fill = total_t)) +
#   geom_tile() +
#   theme(axis.text.x = element_text(angle = 90, hjust = 1, colour = "grey50")) +
#   theme(aspect.ratio = 50 / 5)
# print(g)


# Area under the curve or between 2 lines
g <- ggplot(times, aes(x = date, y = total_t, ymin = 0, ymax = total_t)) +
  geom_ribbon(aes(colour = my))
print(g)

# Area under the curve or between 2 lines
g <- ggplot(times, aes(x = date, y = total_t, ymin = 0, ymax = total_t)) +
  geom_ribbon()
print(g)




# f <-   function(x) {
    # if (x < 0) {
      # return("#2cbd25")
    # } else {
      # return("gray")
    # }
# }

# https://learnr.wordpress.com/2009/06/01/ggplot2-positioning-of-barplot-category-labels/

# % change daily
# baseline: 0
# curr <- times$total_t[-1]
# prev <- times$total_t[1 : (length(times$total_t) - 1)]
# dalChange <- 100 * round((curr - prev) / prev, 2)
# barCols <- sapply(dalChange, f)
# barplot(dalChange,
#   border = NA,
#   space = 0,
#   las = 1,
#   col = barCols,
#   main = "% change, daily")

# TODO(in ggplot2)
# df <- data.frame(dalChange, barCols)
# names(df) <- c("dalChange", "barCols")

# ggplot(trigram_freqs[1:150,], aes(x = 1:150, y=freq)) + geom_bar(stat = "identity")


# g <- ggplot(df, aes(x = dalChange, y = ))

# % change monthly
# baseline: 0
# curr <- times$total_t[-(1 : 30)]
# prev <- times$total_t[1 : (length(times$total_t) - 30)]
# monChange <- 100 * round( (curr-prev) / prev, 2 )
# barCols <- sapply(monChange, f)
# barplot(monChange,
#   border = NA,
#   space = 0,
#   las = 1,
#   col = barCols,
#   main = "% change, monthly")

# % change yearly
# baseline: 0
# curr <- times$total_t[-(1 : 365)]
# prev <- times$total_t[1 : (length(times$total_t) - 365)]
# annChange <- 100 * round( (curr - prev) / prev, 2 )
# barCols <- sapply(annChange, f)
# barplot(annChange, border = NA, space = 0, las = 1, col = barCols, main = "% change, annual")


# print(g)


# % change per day.

# plot of total hours spent sleeping during a month per the total number of hours in that month.

# plot of total hours spent sleeping during a day per 24 hrs.

# heatmap of day (sun, mon, tue, wed, thu, fri, sat) vs no of hours per day (0-1, 1-2, 2-3, ..., 14-15).
# https://learnr.wordpress.com/2010/01/26/ggplot2-quick-heatmap-plotting/

# daily average change and hline at the average I want

# stacked bars (and overlapping bars - https://learnr.wordpress.com/2009/04/02/ggplot2-marimekko-replacement-overlapping-bars/)
# for each month with number of hours (total)
# and spent sleeping (per day) [use of melt function probably](http://seananderson.ca/2013/10/19/reshape.html)
# follow this - https://learnr.wordpress.com/2009/03/17/ggplot2-barplots/

# Can this be done here? - https://learnr.wordpress.com/2009/04/09/ggplot2-sales-dashboard/

# Try this for each month - https://learnr.wordpress.com/2009/05/01/ggplot2-dont-try-this-with-excel-revised/

# use this? https://learnr.wordpress.com/2010/08/16/consultants-chart-in-ggplot2/

# Plot inside a plot - https://learnr.wordpress.com/2009/05/08/ggplot2-plot-inside-a-plot/

# Use color combinations from this - https://learnr.wordpress.com/2009/04/15/ggplot2-qualitative-colour-palettes/
# use plotly

# Change the order of legend labels
# https://learnr.wordpress.com/2010/03/23/ggplot2-changing-the-default-order-of-legend-labels-and-stacking-of-data/

# Generate a fuckin' pdf
# pdf("population_growth.pdf", paper = "a4")
# d_ply(df, .(country), function(x) plot(x$year, x$value, type = "l", main = unique(x$country)))
# dev.off()


# save using ggsave()