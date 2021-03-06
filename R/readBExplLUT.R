#' PREPROCESS LAND-USE DATA
#' @export readBExplLUT
#'
readBExplLUT <- function(filepath, ...){
  df_lut <- read.table(filepath, header = TRUE, sep = ";", dec = ",")
  df_lut$notes<-NULL
  df_lut <- melt(
    df_lut,
    id=(c("EP_Plotid","Explo", "initial_landuse_type", "new_landuse_type")))
  colnames(df_lut) <- c("plotID", "Explo","initial_landuse_type","new_landuse_type","year","landuse")
  df_lut$year <- substr(df_lut$year, 2,5)
  colnames(df_lut)[which(colnames(df_lut) == "plotID")] = "EPID"
  return(df_lut)
}
