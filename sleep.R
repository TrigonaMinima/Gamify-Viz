# How sleep times have changed over time.


library(ggplot2)
library(scales)

times <- read.csv("Data/sleep_times.csv", stringsAsFactors=FALSE)

times$Date <- as.Date(times$Date, "%d-%m-%Y")

times$total_t <- as.integer(substr(x=times$total, start=1, stop=2)) +
  (as.integer(substr(x=times$total, start=4, stop=5))/60)


# time series plot
# baseline: hours and times
g <- ggplot(times, aes(x=Date, y=total_t)) +
  geom_line() +
  scale_x_date(breaks = date_breaks("1 week"), labels = date_format("%d %b")) +
  xlab("") + ylab("Hours")

print(g)


f <-   function(x) {
    if (x < 0) {
      return("#2cbd25")
    } else {
      return("gray")
    }
}

# % change daily
# baseline: 0
curr <- times$total_t[-1]
prev <- times$total_t[1 : (length(times$total_t) - 1)]
dalChange <- 100 * round((curr - prev) / prev, 2)
barCols <- sapply(dalChange, f)
barplot(dalChange,
  border = NA,
  space = 0,
  las = 1,
  col = barCols,
  main = "% change, daily")

# TODO(in ggplot2)
# df <- data.frame(dalChange, barCols)
# names(df) <- c("dalChange", "barCols")
# g <- ggplot(df, aes(x = dalChange, y = ))

# % change monthly
# baseline: 0
curr <- times$total_t[-(1 : 30)]
prev <- times$total_t[1 : (length(times$total_t) - 30)]
monChange <- 100 * round( (curr-prev) / prev, 2 )
barCols <- sapply(monChange, f)
barplot(monChange,
  border = NA,
  space = 0,
  las = 1,
  col = barCols,
  main = "% change, monthly")

# % change yearly
# baseline: 0
# curr <- times$total_t[-(1 : 365)]
# prev <- times$total_t[1 : (length(times$total_t) - 365)]
# annChange <- 100 * round( (curr - prev) / prev, 2 )
# barCols <- sapply(annChange, f)
# barplot(annChange, border = NA, space = 0, las = 1, col = barCols, main = "% change, annual")


print(g)