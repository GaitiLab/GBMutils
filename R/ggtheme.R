#' @title Standard theme for figures used in manuscript
#' @param base_size Base font size (default = 14)
#' @param base_family Base font family (default = "Helvetica")
#' @return ggplot2 theme
#' @export
#' @examples \dontrun{
#' import(ggplot2)
#' ggplot(data = data, aes(x = x, y = y)) +
#'         geom_point() +
#'         GBM_theme()
#' }
GBM_theme <- function(base_size = 14, base_family = "Helvetica") {
        (gggthemes::theme_foundation(base_size = base_size, base_family = base_family) +
                ggplot2::theme(
                        # Plot
                        plot.title = ggplot2::element_markdown(
                                face = "bold", size = ggplot2::rel(1.2),
                                hjust = 0.5
                        ),
                        plot.background = ggplot2::element_rect(colour = NA),
                        plot.margin = grid::unit(c(10, 5, 5, 5), "mm"),

                        # Panel
                        panel.background = ggplot2::element_rect(colour = NA),
                        panel.border = ggplot2::element_rect(colour = NA),
                        panel.grid.major = element_blank(),
                        panel.grid.minor = element_blank(),
                        # Exes
                        axis.title = ggplot2::element_markdown(size = ggplot2::rel(1.1)),
                        axis.title.y = ggplot2::element_markdown(
                                angle = 90,
                                vjust = 2
                        ),
                        axis.title.x = ggplot2::element_markdown(vjust = -0.2),
                        axis.text = ggplot2::element_text(size = ggplot2::rel(1)),
                        axis.line = element_line(colour = "black"),
                        axis.ticks = element_line(),
                        # Legend
                        legend.key = ggplot2::element_rect(colour = NA),
                        legend.position = "bottom",
                        legend.direction = "horizontal",
                        legend.key.size = grid::unit(0.2, "cm"),
                        legend.spacing = grid::unit(
                                0,
                                "cm"
                        ),
                        legend.title = ggplot2::element_text(face = "plain"),
                        # Strip (facets)
                        strip.background = ggplot2::element_rect(
                                colour = "#ffffff",
                                fill = "#ffffff"
                        ),
                        strip.text = ggplot2::element_markdown(
                                face = "bold",
                                size = ggplot2::rel(1.1)
                        )
                ))
}
