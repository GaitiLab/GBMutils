# Cell type labels for CCI_CelLClass L1 and L2
#' @title L1 cell type labels
#' @export
get_L1 <- function(return_tme_only = FALSE) {
    tme <- c(
        # TME
        "Microglia",
        "Macrophage",
        "Neuron",
        "Pericyte",
        "Oligodendrocyte",
        "OPC",
        "Astrocyte",
        "T_cell"
    )
    if (return_tme_only) {
        return(tme)
    } else {
        return(c(tme, "Malignant"))
    }
}
#' @title L2 cell type labels
#' @export
get_L2 <- function(return_tme_only = FALSE, return_tumor_only = FALSE) {
    tme <- c(
        # TME
        "Myeloid_Immunosuppressive",
        "Myeloid_Inflammatory",
        "Neuron",
        "Pericyte",
        "Oligodendrocyte",
        "OPC",
        "Astrocyte",
        "T_cell"
    )
    tumor <- c( # Malignant
        "Differentiated_like",
        "Progenitor_like"
    )
    if (return_tumor_only) {
        return(tme)
    } else if (return_tumor_only) {
        return(tumor)
    } else {
        return(c(tme, tumor))
    }
}

#' @title L4 cell type labels
#' @param return_tme_only return only tme cell types
#' @param return_tumor_only return only tumor states
#' @export
get_L2_2 <- function(return_tme_only = FALSE, return_tumor_only = FALSE) {
    tme <- c(
        # TME
        "Myeloid_Immunosuppressive",
        "Myeloid_Inflammatory",
        "Neuron",
        "Pericyte",
        "Oligodendrocyte",
        "OPC",
        "Astrocyte",
        "T_cell"
    )
    tumor <- c( # Malignant
        "Differentiated_like",
        "Progenitor_like",
        "Neuronal OPC-like"
    )
    if (return_tumor_only) {
        return(tme)
    } else if (return_tumor_only) {
        return(tumor)
    } else {
        return(c(tme, tumor))
    }
}

palette <- palette.colors(palette = "Classic Tableau")
# scales::show_col(palette)

#' @title Color palette for L1 TME cell types
#' @export
get_colors_L1_TME <- function() {
    COLORS_L1_TME <- palette[seq_along(get_L1(return_tme_only = TRUE))]
    names(COLORS_L1_TME) <- get_L1(return_tme_only = TRUE)
    return(COLORS_L1_TME)
}


#' @title Color palette for L2 TME cell types
#' @export
get_colors_L2_TME <- function() {
    COLORS_L2_TME <- palette[seq_along(get_L2(return_tme_only = TRUE))]
    names(COLORS_L2_TME) <- get_L2(return_tme_only = TRUE)
    return(COLORS_L2_TME)
}

#' @title Color palette for L1 cell types
#' @export
get_colors_L1 <- function() {
    COLORS_L1 <- palette[seq_along(get_L1())]
    names(COLORS_L1) <- get_L1()
    return(COLORS_L1)
}


#' @title Color palette for L2 cell types
#' @export
get_colors_L2 <- function() {
    COLORS_L2 <- palette[seq_along(get_L2())]
    names(COLORS_L2) <- get_L2()
    return(COLORS_L2)
}

#' @title Color palette for L2_2 cell types
#' @export
get_colors_L2_2 <- function() {
    COLORS_L2 <- palette[seq_along(get_L2_2())]
    names(COLORS_L2) <- get_L2_2()
    return(COLORS_L2)
}

#' @title Dictionary of color palettes
#' @export
CCI_CELLTYPES_COLOR_PALETTE <- list("CCI_CellClass_L1" = get_colors_L1(), "CCI_CellClass_L2" = get_colors_L2(), "CCI_CellClass_L2_2" = get_colors_L2_2())


#' @title Load colour pallette for regions
#' @return Named list for region colour pallette
#' @export
LoadRegionColours <- function() {
    colours <- c(PT = "#0173b2", TE = "#de8f05", TC = "#029e73")
    return(colours)
}
