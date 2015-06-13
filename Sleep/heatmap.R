
# heatmap of day (sun, mon, tue, wed, thu, fri, sat) vs no of hours per day (0-1, 1-2, 2-3, ..., 14-15).
# https://learnr.wordpress.com/2010/01/26/ggplot2-quick-heatmap-plotting/

times$class <- as.factor(cut(times$total_t, max(times$total_t), labels=F))

g <- ggplot(times, aes(x = day, y = class)) +
    geom_tile(aes(fill = total_t), colour = "white") +
    scale_fill_gradient(low = "white", high = "steelblue") +
    theme_bw()
print(g)