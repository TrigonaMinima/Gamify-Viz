# Various visualizations out of my daily sleep times.
# following this - https://learnr.wordpress.com/


# https://learnr.wordpress.com/2009/05/18/ggplot2-three-variable-time-series-panel-chart/

library(grid)
library(plyr)

g <- ggplot(times, aes(x = date, y = total_t, ymin = 0, ymax = 24)) +
  theme_bw() +
  geom_line(colour = "grey70") +
  geom_point(colour = "grey50", size = 0.7) +
  theme(panel.margin = unit(0, "lines"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank()) +
  facet_grid(facet ~ ., scales = "free", as.table = FALSE)
g

# g + geom_step(subset = .(variable == "facet"))





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




# Kernel Density Plot
g <- ggplot(times, aes(total_t)) +
  stat_density(geom = "path", kernel = "rect", position = "identity", bw = 0.2) +
  geom_rug()
print(g)

# Scatter Plot
g <- ggplot(times) + geom_point(aes(total_t, day), shape = 1)
print(g)

# Faceted scatterplot plot with all points in the background of each plot.
# g <- ggplot(times, aes(date, total_t)) +
#   geom_point(data = transform(times, day = NULL), colour = "grey92") +
#   geom_point() +
#   facet_grid(~day) +
#   theme_bw()
# print(g)

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
# g <- ggplot(times, aes(factor(day), total_t)) +
#   geom_boxplot() + coord_flip() + ylab("Average time spent sleeping")
# print(g)

# Ribbon Plot
# g <- ggplot(times, aes(total_t)) +
#   geom_ribbon(aes(ymax = ..density.., ymin = -..density..), stat = "density") +
#   # facet_grid(day ~ ., as.table = F, scales = "free_y") +
#   labs(x = "Time spent sleeping", y = "Days")
# print(g)

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