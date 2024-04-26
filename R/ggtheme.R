#' Standard theme for plots
#' @param base_size Base font size
#' @param base_family Base font family
#' @return ggplot2 theme
#' @export
#' @import ggplot2
#' @import ggthemes
#' @import grid
#' @import ggtext

GBM_theme <- function(base_size = 14, base_family = "Helvetica") {
    (theme_foundation(base_size = base_size, base_family = base_family)
    + theme(
            plot.title = element_markdown(
                face = "bold",
                size = rel(1.2), hjust = 0.5
            ),
            text = element_markdown(),
            panel.background = element_rect(colour = NA),
            plot.background = element_rect(colour = NA),
            panel.border = element_rect(colour = NA),
            axis.title = element_markdown(face = "bold", size = rel(1.1)),
            axis.title.y = element_markdown(angle = 90, vjust = 2),
            axis.title.x = element_markdown(vjust = -0.2),
            axis.text = element_markdown(size = rel(1)),
            axis.line = element_line(colour = "black"),
            axis.ticks = element_line(),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            legend.key = element_rect(colour = NA),
            legend.position = "bottom",
            legend.direction = "horizontal",
            legend.key.size = unit(0.2, "cm"),
            legend.spacing = unit(0, "cm"),
            legend.title = element_markdown(face = "plain"),
            plot.margin = unit(c(10, 5, 5, 5), "mm"),
            strip.background = element_rect(colour = "#ffffff", fill = "#ffffff"),
            strip.text = element_markdown(face = "bold", size = rel(1.1))
        ))
}
