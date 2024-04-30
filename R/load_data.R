# Functions for loading items relevant to analyses across GBM project

#' @title Load gbm_regional_study.rds
#' @param mounted_gaitigroup_dirpath mounted path for Gaitigroup cluster
#' @return Seurat object with filtered cells from Parsebio and 10X Multiome cohorts. Metadata lookup found on project_status.xlsx on OneDrive
#' @export
#' @import Seurat
load_GBM_data <- function(mounted_gaitigroup_dirpath = "") {
    if (!interactive()) {
        # Only works on cluster
        seurat_object <- readRDS(paste0(cluster_gbm_seurat_path, "/", gbm_seurat_obj_rel_path))
        return(seurat_object)
    } else if (dir.exists(mounted_gaitigroup_dirpath)) {
        # if not interactive
        seurat_obj <- readRDS(paste0(mounted_gaitigroup_dirpath, gbm_seurat_obj_rel_path))
        return(seurat_object)
    } else {
        return("File not found")
    }
}
#' @title Load genelist of invasive signature
#' @description Load invasive signature derived from comparing PT OPC/NPC1 to Tumour bulk OPC/NPC1 cells
#' @param name either 'high' or 'low'
#' @return A list containing two vectors. Invasive up genes at index 1. Invasive down genes at index 2
#' @importFrom dplyr %>% filter
#' @export
load_invasive_signature <- function(name) {
    return(degs_signature[[name]])
}

#' @title Load color palette
#' @description Load pre-defined color palette for cell types, regions etc.
#' @return named vector with colors
#' @export
#' @importFrom tibble deframe
#' @importFrom dplyr select
#' @importFrom tidyr drop_na
load_color_palette <- function(name = "CellClass_L2") {
    color <- paste0(name, "_color")
    cols_to_select <- c(name, color)
    return(color_palettes %>%
        select(all_of(cols_to_select)) %>%
        drop_na() %>%
        deframe())
}
