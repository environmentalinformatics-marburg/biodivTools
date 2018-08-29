#' Read vegetation releves data
#'
#' @description
#' Read vegetation releves data from files provided in the format of the
#' DFG Biodiversity Exploratories.
#'
#' @param records Full path and name of the vegetation releves file.
#'
#' @return
#' A \code{data.frame} object.
#'
#' @author
#' Thomas Nauss
#'
#' @references
#' NONE
#'
#' @examples
#' \notrun{
#' }
#'
#' @export readBExpVegRecordsForest
#' @name readBExpVegRecordsForest
#'
readBExpVegRecordsForest <- function(records){
  df_records <- read.table(records, header = TRUE, sep = "\t", dec = ".")
  df_records$EpPlotID = NULL
  colnames(df_records)[which(colnames(df_records) == "Useful_EPPlotID")] = "EPID"
  colnames(df_records)[which(colnames(df_records) == "cover")] = "Cover"
  return(df_records)
}
