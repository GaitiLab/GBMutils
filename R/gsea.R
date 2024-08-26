#' @title Save Patient FGSEA results
#' @param fgsea_results path to fgsea results
#' @param output_dir path to output directory for storing results
#' @param file_header name to use for final output directory {output_dir}/{file_header} and generated files {file_header}{}.txt
#' @param ranks named vector with ranks
#' @export
write_patient_fgsea_results <- function(
    fgsea_results, output_dir,
    file_header, ranks) {
    directory_fullpath <- file.path(
        output_dir,
        file_header
    )
    GaitiLabUtils::create_dir(directory_fullpath)

    # calculate the rank at max
    # fgsea returns the leading edge.  Just need to extract the highest rank from
    # set to get the rank at max
    calculated_rank_at_max <- apply(fgsea_results, 1,
        FUN = function(x, ranks) {
            max(which(names(ranks)
            %in% unlist(x[8])))
        }, ranks = ranks
    )


    enr <- cbind(
        fgsea_results$pathway,
        fgsea_results$pathway,
        "Details",
        fgsea_results$size,
        fgsea_results$ES,
        fgsea_results$NES,
        fgsea_results$pval,
        fgsea_results$padj,
        0,
        calculated_rank_at_max,
        apply(fgsea_results, 1,
            FUN = function(x) {
                paste(unlist(x[8]), collapse = ",")
            }
        )
    )

    colnames(enr) <- c(
        "name", "description",
        "GS details", "SIZE", "ES",
        "NES", "pval", "padj", "FWER",
        "Rank at Max", "leading edge genes"
    )

    enr_filename_positive <- paste0(file_header, "fgsea_enr_results_pos.txt", sep = "")
    enr_filename_docker_positive <- file.path(
        directory_fullpath,
        enr_filename_positive
    )

    write.table(enr[which(enr[, "NES"] >= 0), ],
        enr_filename_docker_positive,
        col.name = TRUE, sep = "\t", row.names = FALSE, quote = FALSE, fileEncoding = "latin1"
    )

    enr_filename_negative <- paste0(file_header, "fgsea_enr_results_neg.txt", sep = "")
    enr_filename_docker_negative <- file.path(
        directory_fullpath,
        enr_filename_negative
    )

    write.table(enr[which(enr[, "NES"] < 0), ],
        enr_filename_docker_negative,
        col.name = TRUE, sep = "\t", row.names = FALSE, quote = FALSE, fileEncoding = "latin1"
    )
}
