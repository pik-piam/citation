#' package2zenodo
#' 
#' Creates a .zenodo.json for a R package. This file is an
#' (officially unsupported) method to provide ZENODO with metadata information
#' about the package and will overwrite the information ZENODO would otherwise 
#' auto-generate from the repository. 
#' 
#' @param package either the path to the main folder of a package (containing a DESCRIPTION file)
#' or the name of the package. If a path is provided the .zenodo.json file will be directly added
#' to the folder. Otherwise the content of such a file is just returned.
#' @author Jan Philipp Dietrich
#' @importFrom jsonlite toJSON
#' @importFrom desc desc
#' @return The metadata information that should be provided to Zenodo in JSON format.
#' @export
#' @examples
#' 
#' package2zenodo("citation")
#' 
package2zenodo <- function(package=".") {
  if(file.exists(paste0(package,"/DESCRIPTION"))) {
    d <- desc(file=paste0(package,"/DESCRIPTION"))
    folder <- package
  } else {
    d <- desc(package=package)
    folder <- NULL
  }
  
  authors <-  format(d$get_authors(), include = c("family", "given"),
                     braces = list(family = c("", ",")))
  json <- list(title=paste0(d$get("Package"),": ",d$get("Title")),
               version=d$get("Version"),
               description=paste0("<p>",d$get("Description"),"</p>"),
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
