#' @title Adapt transparency
#' @param ix index
#' @param groups list of cell types of interest
#' @param alpha_new value for new transparency (0 = transparent, 1 = full color)
adapt_transparency <- function(ix, groups, colors, alpha_new = 0.25) {
    if (names(colors)[ix] %in% groups) {
        return(adjustcolor(colors[ix], alpha.f = 1))
    } else {
        return(adjustcolor(colors[ix], alpha.f = alpha_new))
    }
}
