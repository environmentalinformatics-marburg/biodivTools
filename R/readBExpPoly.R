#' Read plot polygon data
#'
#' @description
#' Read plot polygons in the format of the DFG Biodiversity Exploratories and
#' adjust the plot IDs.
#'
#' @param shp Full path and name of the shp file.
#' @param crs CRS information in order to reproject the polygons.
#'
#' @return
#' A \code{SpatialPolygonDataFrame} object.
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
#' @export readBExpPoly
#' @name readBExpPoly
#'
readBExpPoly <- function(shp, crs=NULL, ...){

    plt <- readOGR(shp, layer = ogrListLayers(shp))
    if(!is.null(crs)){
      plt <- spTransform(plt, crs)
    }
    plt$EP <- as.character(plt$EP)
    plt$EP[nchar(plt$EP) == 4] <- paste0(
      substr(plt$EP[nchar(plt$EP) == 4], 1, 3), "0",
      substr(plt$EP[nchar(plt$EP) == 4], 4, 4))
    return(plt)
}
