#' Read stand structural attribute data.
#'
#' @description
#' Read stand structural attribute data from files provided in the format of the
#' DFG Biodiversity Exploratories.
#'
#' @param filepath Full path and name of the stand structural file.
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
#' @export readBExpStandStruc
#' @name readBExpStandStruc
#'
readBExpStandStruc <- function(filepath){
  df <- read.table(filepath, header = TRUE, sep = "\t", dec = ".")
  df$Exploratory <- NULL
  df$EP_Plotid <- NULL
  colnames(df)[1] <- "EPID"
  return(df)
}
