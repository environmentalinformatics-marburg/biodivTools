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
  return(df_lui)
}
