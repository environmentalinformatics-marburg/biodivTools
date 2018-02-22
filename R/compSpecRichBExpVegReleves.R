#' Compute species richness from vegetation releves data
#'
#' @description
#' Compute species richness from multi-year vegetation releves data in the
#' format of the DFG Biodiversity Exploratories.
#'
#' @param vegrel \code{data.frame} containing multi-year vegetation releves data.
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
#' @export compSpecRichBExpVegReleves
#' @name compSpecRichBExpVegReleves
#'
compSpecRichBExpVegReleves <- function(vegrel){
  vegrel_div <- lapply(unique(vegrel$Year), function(y){
    act <- vegrel[vegrel$Year == y,]
    act$cover_bin <- act$cover
    act$cover_bin[act$cover > 0.0 & !is.na(act$cover)] <- 1
    specrich <- aggregate(act$cover_bin, by = list(act$EPID), FUN = "sum")
    names(specrich) <- c("EPID", "SPECRICH")
    specrich$Year <- as.numeric(y)

    shannon <- lapply(unique(vegrel$EPID), function(p){
      act <- vegrel[vegrel$Year == y & vegrel$EPID == p, ]
      shannon <- vegan::diversity(act$cover)
      shannon <- data.frame(EPID = as.character(act$EPID[1]),
                            SHANNON = shannon,
                            Year = as.numeric(y))
      return(shannon)
    })
    shannon <- do.call("rbind", shannon)

    comb <- merge(specrich, shannon, by = c("EPID", "Year"))
    comb$EVENESS <- comb$SHANNON/log(comb$SPECRICH)
    return(comb)
  })
  vegrel_div <- do.call("rbind", vegrel_div)
  return(vegrel_div)
}
