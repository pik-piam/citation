#' @title scan repositories
#' @description Scan repositories for existing CITATION.cff information
#' @param repos character vector of repository urls or links to CITATION.cff
#' files to be scanned
#' @return A list with CITATION.cff information collected from the
#' provided repositories
#' @author Jan Philipp Dietrich
#' @export
#' @examples
#' scanRepos(c("https://github.com/magpiemodel/magpie",
#'             "https://github.com/remindmodel/remind"))
#' @seealso read_cff

scanRepos <- function(repos) {
  guessCITATIONurl <- function(url) {
    if (basename(url) == "CITATION.cff") return(url)
    if (grepl("github.com", url, fixed = TRUE)) {
      url <- sub("github.com", "raw.githubusercontent.com",
                 file.path(url, "HEAD/CITATION.cff"), fixed = TRUE)
      return(url)
    }
    return(file.path(url, "CITATION.cff"))
  }
  cff <- list()
  for (r in repos) {
     url <- guessCITATIONurl(r)
     tryCatch(
{
       cff[[r]] <- suppressWarnings(read_cff(url))
       message("read in CITATION.cff for ", r)
       },
 error = function(e) warning("CITATION.cff for ", r, " not found", call. = FALSE))
     if (class(cff$r) %in% "try-error") cff$r <- "MISSING"
  }
  return(cff)
}
