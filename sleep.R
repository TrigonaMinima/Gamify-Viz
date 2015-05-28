# Various visualizations out of my daily sleep times.

# Libraries
library(ggplot2)
library(scales)

# Load data.
times <- read.csv("Data/sleep_times.csv", stringsAsFactors=FALSE)

# Date to "date" format.
times$Date <- as.Date(times$Date, "%d-%m-%Y")

# Adding day corresponding to the date.
times$day <- substr(x=weekdays(times$Date), start=1, stop=3)

# Total time in hours (2:30 hrs -> 2.5 hrs)
times$total_t <- as.integer(substr(x=times$total, start=1, stop=2)) +
  (as.integer(substr(x=times$total, start=4, stop=5))/60)

# Rounded total time.
times$total_round <- round(times$total_t)

# Time series plot.
# Baseline: hours
g <- ggplot(times, aes(x=Date, y=total_t)) +
  geom_line() +
  scale_x_date(breaks = date_breaks("1 week"), labels = date_format("%d %b")) +
  xlab("") + ylab("Hours")
print(g)

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

# Point
g <- ggplot(times) + geom_point(aes(total_t, day), shape = 1)
print(g)






# f <-   function(x) {
    # if (x < 0) {
      # return("#2cbd25")
    # } else {
      # return("gray")
    # }
# }

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

