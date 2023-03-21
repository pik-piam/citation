#' cffReport
#'
#' Creates a report in markdown format for a provided list of repositories
#' and or CITATION.cff files.
#'
#' @param repos character vector of repository urls or links to CITATION.cff
#' files to be scanned
#' @param file character string naming a file the report should be written to. If
#' NULL the report will be directly returned by the function.
#' @param sortBy category by which the report should sort its entries
#' @return the report in markdown format
#' @author Jan Philipp Dietrich
#' @export

cffReport <- function(repos, file = NULL, sortBy = "title") {
  cffList <- scanRepos(repos)
  if (!is.null(sortBy)) {
    order <- try(order(vapply(cffList, function(x) return(x[[sortBy]]), character(1))), silent = TRUE)
    if (!inherits(order, "try-error")) {
      cffList <- cffList[order]
    } else {
      warning("Could not sort reports by provided category")
    }
  }
  md <- paste(lapply(cffList, cff2md), collapse = "\n\n")
  if (is.null(file)) return(md)
  writeLines(md, file)
  invisible(md)
}
