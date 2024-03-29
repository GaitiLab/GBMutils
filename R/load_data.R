# Functions for loading items relevant to analyses across GBM project

#' @title Load gbm_regional_study.rds
#' @param mounted_gaitigroup_dirpath mounted path for Gaitigroup cluster
#' @return Seurat object with filtered cells from Parsebio and 10X Multiome cohorts. Metadata lookup found on project_status.xlsx on OneDrive
#' @export
#' @import Seurat
LoadGBM <- function(mounted_gaitigroup_dirpath = "") {
    if (!interactive()) {
        # Only works on cluster
        seurat_object <- readRDS("/cluster/projects/gaitigroup/Data/GBM/processed_data/gbm_regional_study.rds")
        return(seurat_object)
    } else if (dir.exists(mounted_gaitigroup_dirpath)) {
        # if not interactive
        seurat_obj <- readRDS(paste0(mounted_gaitigroup_dirpath, "/Data/GBM/processed_data/gbm_regional_study.rds"))
        return(seurat_object)
    } else {
        return("File not found")
    }
}
#' @title Load genelist of invasive signature
#' @description Load invasive signature derived from comparing PT OPC/NPC1 to Tumour bulk OPC/NPC1 cells
#' @return A list containing two vectors. Invasive up genes at index 1. Invasive down genes at index 2
#' @export
LoadInvasiveSig <- function() {
    require(dplyr)

    degs <- read.csv(system.file("extdata", "de_results.csv", package = "GBMutils"))
    degs_up <- degs %>%
        filter(log2FoldChange > 1 & padj < 0.05)
    degs_dn <- degs %>%
        filter(log2FoldChange < -1 & padj < 0.05)
    degs_list <- list(degs_up$gene, degs_dn$gene)

    return(degs_list)
}
