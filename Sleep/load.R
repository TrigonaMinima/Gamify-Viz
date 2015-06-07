# A common file to load all the libraries & data and
# converting data to the required format.

# Load Libraries
library(ggplot2)
library(scales)
library(reshape2)

# Load data.
times <- read.csv("Data/sleep_times.csv", stringsAsFactors=FALSE)

# Date to R's "date" format.
times$date <- as.Date(times$date, "%d-%m-%Y", , origin="1970-01-01")

# Adding day corresponding to the date.
times$day <- substr(x=weekdays(times$date), start=1, stop=3)

# Adding month-year for a corresponding date
times$my <- paste(format(times$date, "%b"),
  substr(times$date, start = 3, stop = 4),
  sep = "")

# Total time in hours (2:30 hrs -> 2.5 hrs)
times$total_t <- as.integer(substr(x = times$total, start = 1, stop = 2)) +
  (as.integer(substr(x = times$total, start = 4, stop = 5)) / 60)

# Average time in hours (2:30 hrs -> 2.5 hrs)
times$avg_t <- as.integer(substr(x = times$avg, start = 1, stop = 2)) +
  (as.integer(substr(x = times$avg, start = 4, stop = 5)) / 60) +
  (as.integer(substr(x = times$avg, start = 7, stop = 8)) / 3600)

times$facet <- rep(1:length(times$date), 1)

# Rounded total time.
times$total_round <- round(times$total_t)

# Conversion of time to the "POSIXct" format of R.
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

# Colour vector for the following graph
times$colour <- ifelse((seq(1:length(times$date)) %% 2) ==  1, "red", "grey30")
