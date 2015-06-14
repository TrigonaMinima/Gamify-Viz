# heatmap of day (sun, mon, tue, wed, thu, fri, sat) vs no of hours per day (0-1, 1-2, 2-3, ..., 14-15).

times.heatmap1 <- as.data.frame(table(times$day, times$total_round))
names(times.heatmap1) <- c("day", "total", "freq")

g <- ggplot(times.heatmap1, aes(x = day, y = total)) +
    geom_tile(aes(fill = freq), colour = "white") +
    scale_fill_gradient(low = "white", high = "steelblue") +
    labs(x = "", y = "") +
    ggtitle("Freq based heatmap") +
    scale_x_discrete(expand = c(0, 0)) +
    scale_y_discrete(expand = c(0, 0)) +
    theme_bw() +
    theme(axis.ticks = element_blank(), legend.position = "none")
print(g)


# heatmap of month-year vs no of hours per day (0-1, 1-2, 2-3, ..., 14-15).

times.heatmap2 <- as.data.frame(table(times$my, times$total_round))
names(times.heatmap2) <- c("my", "total", "freq")

g <- ggplot(times.heatmap2, aes(x = my, y = total)) +
    geom_tile(aes(fill = freq), colour = "white") +
    scale_fill_gradient(low = "white", high = "steelblue") +
    labs(x = "", y = "") +
    ggtitle("Freq based heatmap") +
    scale_x_discrete(expand = c(0, 0)) +
    scale_y_discrete(expand = c(0, 0)) +
    theme_bw() +
    theme(axis.ticks = element_blank(), legend.position = "none")
print(g)
