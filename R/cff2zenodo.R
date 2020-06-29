#' cff2zenodo
#'
#' Converter citation file format to .zenodo.json metadata file for proper
#' metadata input to Zenodo.
#'
#' @param x path to citation file or read in citation in citation file format. If a path is provided the .zenodo.json information will be written
#' directly to a .zenodo.json file in the corresponding folder. Otherwise the metadata will be just returned by the function.
#' @author Jan Philipp Dietrich
#' @importFrom jsonlite toJSON
#' @return The metadata information that should be provided to Zenodo in JSON format.
#' @export

cff2zenodo <- function(x) {
  folder <- NULL
  if(is.character(x) && file.exists(x)) {
    folder <- dirname(x)
    x <- read_cff(x)
  }
  #convert authors
  tmp <- function(x) {
    name <- paste(x[["family-names"]],
                  x[["given-names"]],
                  sep=", ")
    out <- list(name=name)
    if(!is.null(x[["affiliation"]])) out$affiliation <- x[["affiliation"]]
    if(!is.null(x[["orcid"]])) out$orcid <- sub("^.*/","",x[["orcid"]])
    return(out)
  }
    
  json <- list(title=x$title,
               version=x$version,
               creators=lapply(x$authors,tmp),
               keywords=x$keywords,
               license=list(id=x$license),
               publication_date=x$`date-released`)
    
  out <- toJSON(json,pretty=TRUE,auto_unbox = TRUE)
  if(!is.null(folder)) {
    zenodofile <- paste0(folder,"/.zenodo.json")
    if(file.exists(zenodofile)) message("Updated .zenodo.json file")
    else message("Added .zenodo.json file")
    writeLines(out,zenodofile)
    
    rbuildignore <- paste0(folder,"/.Rbuildignore")
    if(file.exists(rbuildignore)) {
      a <- readLines(rbuildignore)
      if(all(!grepl("zenodo.json",a,fixed = TRUE))) {
        a <- c(a,"^.*\\.zenodo.json$")
        writeLines(a,rbuildignore)
        message("Added .zenodo.json to .Rbuildignore")
      }
    }
    invisible(out)
  } else {
    return(out)
  }
}
