#' Extract name from filepath
#'
#' @param filepath filepath
#' @return name of file without extension
#'
#' @examples examples get_name("R/my_script.R") returns 'my_script'
#' @export
#' @importFrom tools file_path_sans_ext
#' @importFrom fs path_file
#'
get_name <- function(filepath) {
    return(file_path_sans_ext(path_file(filepath)))
}

#' Create directory
#'
#' @description Create directory if it does not exist
#'
#' @param dir_path Path to directory to be created
#'
#' @examples create_dir("/Users/johndoe/my_new_dir")
#' @export
#' @importFrom glue glue
create_dir <- function(dir_path) {
    if (!dir.exists(dir_path)) {
        log_info(glue("Creating directory {dir_path}"))
        dir.create(dir_path, recursive = TRUE)
    } else {
        log_warn(glue("Directory {dir_path} already exists."))
    }
}

#' Obtain current date
#' @description Obtain current date in format YYYYMMDD
#' @return current date
#' @export
get_current_date <- function() {
    return(format(Sys.time(), "%Y%m%d"))
}


#' Combine p-values
#' @description Combine p-values using Fisher's method
#' @param p_values vector of p-values
#' @return combined p-value
#' @export
#' @importFrom metap sumlog
get_p <- function(x) {
    if (length(x) > 1) {
        return(sumlog(x)$p)
    } else {
        return(x)
    }
}

#' @title Adapt transparency
#' @param ix index
#' @param groups list of cell types of interest
#' @param alpha_new value for new transparency (0 = transparent, 1 = full color)
adapt_transparency <- function(ix, groups, colors, alpha_new = 0.25) {
    if (names(colors)[ix] %in% groups) {
        return(adjustcolor(colors[ix], alpha.f = 1))
    } else {
        return(adjustcolor(colors[ix], alpha.f = alpha_new))
    }}

#' @title Transpose dataframe
#' @param df dataframe
#' @param set_index set 'col1' as index by default FALSE,
#' @return transposed dataframe
#' @export
#' @importFrom tibble %>% rownames_to_column
#' @importFrom tidyr  pivot_longer pivot_wider
transpose_df <- function(df, set_index = FALSE) {
    t_df <- df %>%
        rownames_to_column() %>%
        pivot_longer(!rowname, names_to = "col1", values_to = "col2") %>%
        pivot_wider(names_from = "rowname", values_from = "col2")

    if (set_index) {
        t_df <- t_df %>% column_to_rownames("col1")
    }
    return(t_df)
}

#' @title Function for getting get_pcs
#' @param seurat_obj seurat object
#' @param reduc layer to use for 'reduction' (default: pca)
#' @param var Last point where change of % of variation is more than X%
#' @export
get_pcs <- function(seurat_obj, reduc = "pca", var = 0.05) {
    # Determine percent of variation associated with each PC
    pct <- seurat_obj[[reduc]]@stdev / sum(seurat_obj[[reduc]]@stdev) * 100
    # Calculate cumulative percents for each PC
    cumu <- cumsum(pct)
    # Determine which PC exhibits cumulative percent greater than 90% and %
    # variation associated with the PC as less than 5
    co1 <- which(cumu > 90 & pct < 5)[1]
    # Determine the difference between variation of PC and subsequent PC
    # Last point where change of % of variation is more than 0.05%
    co2 <- sort(which((pct[seq(1, length(pct) - 1)] - pct[seq(2, length(pct))]) > var),
        decreasing = TRUE
    )[1] + 1
    c(co1, co2)
}

#' @title Generate pairs,
#' @param v vector with labels
#' @param remove_self remove self-pairs
#' @param return_undirected remove directed pairs, i.e. A-B == B-A
#' @param collapse delimiter
#' @export
generate_pairs <- function(v, collapse = "__", remove_self = TRUE, return_undirected = TRUE) {
    pairs <- expand.grid(v, v)
    if (remove_self) {
        pairs <- pairs[pairs[, 1] != pairs[, 2], ]
    }
    if (return_undirected) {
        return(unique(apply(pairs, 1, function(x) paste0(sort(x), collapse = collapse))))
    } else {
        return(apply(pairs, 1, paste0, collapse = collapse))
    }
}

#' @title Merge list of dataframes 
#' @param list_of_dfs list of dataframes for merging
#' @param by merge on key (Default = i)
#' @param all.x merge on x (left dataframe)
merge_dfs <- function(list_of_dfs, by, all.x = TRUE) {
    Reduce(
        function(dtf1, dtf2) merge(dtf1, dtf2, by = by, all.x = all.x),
        list_of_dfs
    )
}