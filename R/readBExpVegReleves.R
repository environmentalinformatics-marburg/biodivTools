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
#' @export readBExpVegReleves
#' @name readBExpVegReleves
#'
readBExpVegReleves <- function(vegrel){
  df_vegrel <- read.table(vegrel, header = TRUE, sep = "\t", dec = ".")
  if("EpPlotID" %in% colnames(df_vegrel)){
    df_vegrel$EPID <- as.character(df_vegrel$EpPlotID)
  } else {
    df_vegrel$EPID <- as.character(df_vegrel$EP_PlotId)
  }
  df_vegrel$EPID[nchar(df_vegrel$EPID) == 4] <- paste0(
    substr(df_vegrel$EPID[nchar(df_vegrel$EPID) == 4], 1, 3), "0",
    substr(df_vegrel$EPID[nchar(df_vegrel$EPID) == 4], 4, 4))
  return(df_vegrel)
}
