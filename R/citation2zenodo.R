#' citation2zenodo
#' 
#' Converts an object of class citation into a .zenodo.json file. This file is an
#' (officially unsupported) method to provide ZENODO with metadata information
#' about the package and will overwrite the information ZENODO would otherwise 
#' auto-generate from the repository. 
#' 
#' @param cit an object of class citation as returned for instance by the function \code{\link{citation}},
#' or the name of a R package to be used as source.
#' @param folder a folder the file should be written to. If NULL the content is instead printed.
#' @author Jan Philipp Dietrich
#' @importFrom jsonlite toJSON
#' @export
#' @examples
#' 
#' cit <- citation_doi("citation")
#' citation2zenodo(cit)
#' 
citation2zenodo <- function(cit, folder=NULL) {
  if(is.character(cit)) cit <- citation(cit)
  authors <-  format(cit$author, include = c("family", "given"),
                     braces = list(family = c("", ",")))
  json <- list(title=cit$title,
               version=sub("^[^0-9]*","",cit$note),
               creators=lapply(authors,function(x) return(list(name=x))))
  
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
