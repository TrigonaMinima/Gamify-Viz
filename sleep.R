library(ggplot2)
library(scales)

times <- read.csv("Data/sleep_times.csv", stringsAsFactors=FALSE)

times$Date <- as.Date(times$Date, "%d-%m-%Y")

times$total_t <- as.integer(substr(x=times$total, start=1, stop=2))+(as.integer(substr(x=times$total, start=4, stop=5))/60)


g <- ggplot(times, aes(x=Date, y=total_t)) +
    geom_line() +
    scale_x_date(breaks = date_breaks("1 week"),
       labels = date_format("%d %b")) + xlab("") + ylab("Hours")
