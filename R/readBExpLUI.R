#' Read LUI data
#'
#' @description
#' Read land use intensity index data from files provided in the format of the
#' DFG Biodiversity Exploratories.
#'
#' @param filepath Full path and name of the csv file containing the LUI data.
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
#' @export readBExpLUI
#' @name readBExpLUI
#'
readBExpLUI <- function(filepath, ...){
  df_lui <- read.table(filepath, header = TRUE, sep = "\t", dec = ",")
  # df_lui$Std_procedure.exploratory. <- NULL
  # colnames(df_lui)[colnames(df_lui) == "Std_procedure.year."] <- "year"
  # df_lui$year <- substr(df_lui$year,12,15)
  colnames(df_lui)[which(colnames(df_lui) == "EP.Plotid")] = "EPID"
  colnames(df_lui)[which(colnames(df_lui) == "Std_procedure.year.")] = "Year"
  df_lui$Year = substr(as.character(df_lui$Year), 12, 15)
  df_lui$EPID <- as.character(df_lui$EPID)
  df_lui$EPID[nchar(df_lui$EPID) == 4] <- paste0(
    substr(df_lui$EPID[nchar(df_lui$EPID) == 4], 1, 3), "0",
    substr(df_lui$EPID[nchar(df_lui$EPID) == 4], 4, 4))
  df_lui$EPID <- as.factor(df_lui$EPID)
  return(df_lui)
}
