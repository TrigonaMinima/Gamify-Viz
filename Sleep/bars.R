# Loads libraries and data
source("load.R")


# bars
g <- ggplot(times, aes(x = date, y = total_t)) +
  geom_bar(stat = "identity")
print(g)


# bars
g <- ggplot(times, aes(x = date, y = avg_t)) +
  geom_bar(stat = "identity")
print(g)

g <- ggplot(times, aes(x = date, y = avg_t)) +
  geom_line(stat = "identity")
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