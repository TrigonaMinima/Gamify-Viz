# Loads libraries and data
source("load.R")


# bars
g <- ggplot(times, aes(x = date, y = total_t)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  geom_point()
print(g)



f <- ggplot(times, aes(x = date, y = total_t, colour = my)) +
  geom_bar(stat = "identity") +
  theme_bw()
  # geom_point()
print(f)


# Histogram.
g <- ggplot(times, aes(total_t)) +
  geom_bar(stat = "bin") +
print(g)


# Histogram for each day of the week.
# g <- ggplot(times, aes(total_t)) +
#   geom_histogram(binwidth = 0.2) +
#   facet_wrap(~day, ncol = 3)
# print(g)


# categorise the data in the ranges [1-2, 2-3, 3-4, 4-5, ..., 14-15]