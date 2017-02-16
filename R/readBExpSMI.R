#' Read SMI data
#'
#' @description
#' Read forest intensity index data from files provided in the format of the
#' DFG Biodiversity Exploratories.
#'
#' @param filepath Full path and name of the csv file containing the SMI data.
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
#' @export readBExpSMI
#' @name readBExpSMI
#'
readBExpSMI <- function(filepath, ...){
  df_smi <- read.table(filepath, header = TRUE, sep = "\t", dec = ",")
  df_smi$Exploratory <- NULL
  df_smi$EP_Plotid <- NULL
  colnames(df_smi)[1] <- "EPID"
  return(df_smi)
}
