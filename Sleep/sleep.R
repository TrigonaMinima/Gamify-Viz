
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

# (24-total_t)*100/24 per day

# plot of total hours spent sleeping during a month per the total number of hours in that month.

# plot of total hours spent sleeping during a day per 24 hrs.

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

# Find a relation between day and total_t (avg_t)

# Generate a fuckin' pdf
# pdf("population_growth.pdf", paper = "a4")
# d_ply(df, .(country), function(x) plot(x$year, x$value, type = "l", main = unique(x$country)))
# dev.off()


# save using ggsave()