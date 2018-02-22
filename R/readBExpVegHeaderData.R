#' Read vegetation releves data
#'
#' @description
#' Read vegetation releves data from files provided in the format of the
#' DFG Biodiversity Exploratories.
#'
#' @param vegrel Full path and name of the vegetation releves file.
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
#' @export readBExpVegHeaderData
#' @name readBExpVegHeaderData
#'
readBExpVegHeaderData <- function(filepath){
  df_vegrel <- read.table(filepath, header = TRUE, sep = ";", dec = ".")
  colnames(df_vegrel)[which(colnames(df_vegrel) == "Useful_EP_PlotID")] = "EPID"
  df_vegrel$EPID <- as.character(df_vegrel$EPID)
  df_vegrel$EPID[nchar(df_vegrel$EPID) == 4] <- paste0(
    substr(df_vegrel$EPID[nchar(df_vegrel$EPID) == 4], 1, 3), "0",
    substr(df_vegrel$EPID[nchar(df_vegrel$EPID) == 4], 4, 4))
  df_vegrel$PlotID = NULL
  df_vegrel$EpPlotID = NULL
  return(df_vegrel)
}
