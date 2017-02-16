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
  df_lui$Std_procedure.exploratory. <- NULL
  colnames(df_lui)[colnames(df_lui) == "Std_procedure.year."] <- "year"
  df_lui$year <- substr(df_lui$year,12,15)
  df_lui$EP.Plotid <- as.character(df_lui$EP.Plotid)
  df_lui$EP.Plotid[nchar(df_lui$EP.Plotid) == 4] <- paste0(
    substr(df_lui$EP.Plotid[nchar(df_lui$EP.Plotid) == 4], 1, 3), "0",
    substr(df_lui$EP.Plotid[nchar(df_lui$EP.Plotid) == 4], 4, 4))
  df_lui$EP.Plotid <- as.factor(df_lui$EP.Plotid)
  return(df_lui)
}
