#' cffReport
#'
#' Creates a report in markdown format for a provided list of repositories
#' and or CITATION.cff files. The report starts with a compact summary table
#' followed by full per-entry records, and ends with a section listing any
#' repositories for which no \code{CITATION.cff} was found.
#'
#' @param repos character vector of repository urls or links to CITATION.cff
#' files to be scanned
#' @param file character string naming a file the report should be written to. If
#' NULL the report will be directly returned by the function.
#' @param sortBy category by which the report should sort its entries
#' @param headingLevel integer (1–6); Markdown heading level for individual
#'   entry titles passed through to \code{\link{cff2md}}. Default is 2
#'   (\code{##}). Increase when embedding the output inside a larger document.
#' @return the report in markdown format
#' @author Jan Philipp Dietrich
#' @export

cffReport <- function(repos, file = NULL, sortBy = "title", headingLevel = 2) {

  .summaryTable <- function(cffList) {
    header <- paste(
      "| Title | Institution | Version (date) | License | DOI | Website |",
      "|-------|-------------|----------------|---------|-----|---------|",
      sep = "\n"
    )
    rows <- mapply(function(x, inputUrl) {
      repoUrl <- if (!is.null(x$`repository-code`)) x$`repository-code` else inputUrl
      title <- if (!is.null(repoUrl)) {
        paste0("[", x$title, "](", repoUrl, ")")
      } else {
        x$title
      }

      affiliations <- unique(unlist(lapply(x$authors, function(a) a$affiliation)))
      institution <- if (length(affiliations) > 0) paste(affiliations, collapse = ", ") else ""

      version <- if (!is.null(x$version)) {
        if (!is.null(x$`date-released`)) {
          paste0(x$version, " (", x$`date-released`, ")")
        } else {
          x$version
        }
      } else ""

      license <- if (!is.null(x$license)) {
        paste(x$license, collapse = ", ")
      } else ""

      doi <- if (!is.null(x$doi)) {
        paste0("[", x$doi, "](https://doi.org/", x$doi, ")")
      } else ""

      docs <- if (!is.null(x$url) && !identical(x$url, x$`repository-code`)) {
        paste0("[link](", x$url, ")")
      } else ""

      paste0("| ", title, " | ", institution, " | ", version, " | ", license, " | ", doi, " | ", docs, " |")
    }, cffList, names(cffList), SIMPLIFY = TRUE, USE.NAMES = FALSE)
    paste(c(header, rows), collapse = "\n")
  }

  .missingSection <- function(repos, cffList) {
    missing <- repos[!repos %in% names(cffList)]
    if (length(missing) == 0) return(NULL)
    lines <- c(
      "## Repositories without citation metadata",
      "",
      "The following repositories did not provide a `CITATION.cff` file",
      "and are absent from the overview above:",
      "",
      paste0("- ", missing)
    )
    paste(lines, collapse = "\n")
  }

  cffList <- scanRepos(repos)
  if (!is.null(sortBy)) {
    ord <- try(order(vapply(cffList, function(x) return(x[[sortBy]]), character(1))), silent = TRUE)
    if (!inherits(ord, "try-error")) {
      cffList <- cffList[ord]
    } else {
      warning("Could not sort reports by provided category")
    }
  }

  summaryTable <- .summaryTable(cffList)

  entries <- Filter(Negate(is.null), lapply(cffList, cff2md, headingLevel = headingLevel))
  records <- paste(entries, collapse = "\n\n---\n\n")

  missingSec <- .missingSection(repos, cffList)

  parts <- c(summaryTable, records, missingSec)
  md <- paste(Filter(Negate(is.null), parts), collapse = "\n\n---\n\n")

  if (is.null(file)) return(md)
  writeLines(md, file)
  invisible(md)
}
