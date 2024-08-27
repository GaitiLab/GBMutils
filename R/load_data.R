#' @title Load genelist of invasive signature
#' @description Load invasive signature derived from comparing PT OPC/NPC1 to Tumour bulk OPC/NPC1 cells.
#' @param type choose either 'high' or 'low' (default = 'high')
#' @return A list containing two vectors. Invasive up genes at index 1. Invasive down genes at index 2
#' @importFrom dplyr %>%
#' @export
load_invasive_signature <- function(type = "high") {
    degs_up <- degs_signature %>%
        dplyr::filter(log2FoldChange > 1 & padj < 0.05) %>%
        dplyr::pull(gene)
    degs_dn <- degs_signature %>%
        dplyr::filter(log2FoldChange < -1 & padj < 0.05) %>%
        dplyr::pull(gene)
    if (type == "high") {
        return(degs_up)
    } else if (type == "low") {
        return(degs_dn)
    }
}

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
        dplyr::deframe())
}
