#' @title Load color palette
#' @description Load pre-defined color palette for cell types, regions etc.
#' @return named vector with colors
#' @export
#' @examples \dontrun{
#' palette1 <- load_color_palette(name = "CellClass_L2")
#' palette2 <- load_color_palette(name = "CCI_CellClass_L2_2")
#' }
load_color_palette <- function(name = "CellClass_L2") {
    color <- paste0(name, "_color")
    cols_to_select <- c(name, color)
    return(color_palettes %>%
        dplyr::select(dplyr::all_of(cols_to_select)) %>%
        tidyr::drop_na() %>%
        tibble::deframe())
}
