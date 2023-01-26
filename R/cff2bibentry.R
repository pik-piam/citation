#' cff2bibentry
#'
#' Converter citation file format to bibentry
#'
#' @param x path to citation file or read in citation in citation file format
#' @author Jan Philipp Dietrich
#' @importFrom utils person bibentry
#' @export

cff2bibentry <- function(x) {
  if(is.null(x)) return(x)
  if(is.character(x) && file.exists(x)) x <- read_cff(x)
  #convert authors
  authors <- list()
  for(i in 1:length(x$authors)) {
    authors[[i]] <- person(given=x$authors[[i]][["given-names"]],
                             family=x$authors[[i]][["family-names"]],
                             email=x$authors[[i]][["email"]])
  }
  x$authors <- do.call(c, authors)
  if(!is.null(x$version)) x$title <-paste(x$title,"- Version",x$version)

  bibentry(bibtype="Misc",
           title = x$title,
           author = x$authors,
           doi = x$doi,
           date = x$`date-released`,
           year = format(as.Date(x$`date-released`),"%Y"),
           url=x$url)

}
