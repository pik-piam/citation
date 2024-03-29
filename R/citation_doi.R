#' citation_doi
#' 
#' Extension of the standard citation function which also extracts
#' DOI information from the URL field in the DESCRIPTION file,
#' if available.
#' 
#' @param package a character string with the name of a single package.
#' @author Jan Philipp Dietrich
#' @importFrom utils citation packageDescription
#' @export
#' @examples
#' 
#' citation_doi("citation")
#' 
citation_doi <- function(package) {
  cit <- citation(package, auto=TRUE)
  class(cit) <- "list"
  attr(cit[[1]],"textVersion") <- NULL
  class(cit) <- "bibentry"
  cit$title <- sub(" *\\*$","",cit$title)
  if(!is.null(cit$note)) {
    tmp <- strsplit(cit$note,",[ \n]*")[[1]]
    urls <- grep("http",tmp,value=TRUE)
    cit$note <- paste0(grep("http",tmp,value=TRUE, invert=TRUE), collapse=", ")
    cit$doi <- gsub("\n","",gsub("https://doi.org/","",grep("doi.org",urls,fixed=TRUE, value=TRUE), fixed=TRUE))
    cit$url <- grep("doi.org",urls,fixed=TRUE, value=TRUE, invert=TRUE)
    if(cit$note=="") cit$note <- paste("R package version",packageDescription(package)$Version)
    if(!length(cit$url)) cit$url <- NULL
    if(!length(cit$doi)) cit$doi <- NULL
  }
  return(cit)
}
