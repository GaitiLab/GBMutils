#' Frequently used variables
# TODO renaming old: 'INTERACTIONS_POST_FILTERING_OPTIONS' to CONSENSUS_APPROACHES
CONSENSUS_APPROACHES <- c("stringent_condition", "lenient_condition")

CELLTYPE_ANNOT_ABBREV_DICT <- c(
    "Macrophage" = "M",
    "Microglia" = "MG",
    "Oligodendrocyte" = "Oligo",
    "Astrocyte" = "Astro",
    "Neuron" = "N",
    "OPC" = "OPC",
    "Endothelial" = "Endo",
    "Malignant" = "Mal",
    "Progenitor_like" = "PL",
    "Differentiated_like" = "DL",
    "T_cell" = "T cell",
    "Myeloid_Immunosuppressive" = "M-Immuno",
    "Myeloid_Inflammatory" = "M-Inflam",
    "Neuronal OPC-like" = "N-OPC-like"
)

REGION_GROUPED_LEVELS <- c("PT", "TE", "SC")

#' @title List of CONSENSUS options
#' @description Types of filtering
#' @export
get_consensus_approaches <- function() {
    CONSENSUS_APPROACHES
}
#' @title Dictionary of cell type abbreviations
#' @description Abbreviation for the different cell types to be used in visualization
#' @export
get_annot_abbrev_dict <- function() {
    CELLTYPE_ANNOT_ABBREV_DICT
}

#' @title List of regions in GBM data
#' @description Levels for the Region_grouped variable (ordered)
#' @export
get_region_grouped_levels <- function() {
    REGION_GROUPED_LEVELS
}
