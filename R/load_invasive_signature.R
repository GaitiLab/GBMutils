#' @title Load genelist of invasive signature
#' @description Load invasive signature derived from comparing PT OPC/NPC1 to Tumour bulk OPC/NPC1 cells.
#' @param type choose either 'high' or 'low' (default = 'high')
#' @return A list containing two vectors. Invasive up genes at index 1. Invasive down genes at index 2
#' @importFrom dplyr %>%
#' @export
load_invasive_signature <- function(type = "high") {
    degs_up <- degs_signature %>%
        dplyr::filter(log2FoldChange > log2(1.5) & padj < 0.05) %>%
        dplyr::pull(gene)
    degs_dn <- degs_signature %>%
        dplyr::filter(log2FoldChange < -log2(1.5) & padj < 0.05) %>%
        dplyr::pull(gene)
    if (type == "high") {
        return(degs_up)
    } else if (type == "low") {
        return(degs_dn)
    }
}
