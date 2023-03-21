#' cff2md
#'
#' Creates a summary of the CFF content in markdown format. This
#' can be useful for instance to create software reports.
#'
#' @param x path to citation file or read in citation in citation file format
#' @author Jan Philipp Dietrich
#' @importFrom utils person bibentry
#' @export

cff2md <- function(x) {
  if (is.null(x)) return(x)
  if (is.character(x) && file.exists(x)) x <- read_cff(x)

  .formatAuthors <- function(a) {
    if (!is.null(a[["orcid"]])) {
      if (!grepl("http", a[["orcid"]])) a[["orcid"]] <- paste0("https://orcid.org/", a[["orcid"]])
      return(paste0("[", a[["given-names"]], " ", a[["family-names"]], "](", a[["orcid"]], ")"))
    }
    return(paste0(a["given-names"], " ", a["family-names"]))
  }

  .affiliations <- function(a) {
    return(unique(unlist(lapply(a, function(x) return(x$affiliation)))))
  }

  .returnMarkdown <- function(x, ...) {
    args <- list(...)
    if ("citation" %in% names(args)) x$citation <- format(cff2bibentry(x))
    if ("affiliations" %in% names(args)) {
      x$affiliations <- .affiliations(x$authors)
    }
    if ("authors" %in% names(args)) {
      space <- paste(rep(" ", nchar(args$authors[1])), collapse = "")
      x$authors <- paste(lapply(x$authors, .formatAuthors), collapse = paste0(",\n", space))
    }
    out <- NULL
    for (i in names(args)) {
      if (is.na(args[[i]][2])) args[[i]][2] <- ""
      if (length(x[[i]]) > 1) x[[i]] <- paste(x[[i]], collapse = ", ")
      if (!is.null(x[[i]])) out <- c(out, paste0(args[[i]][1], x[[i]], args[[i]][2]))
    }
    return(paste(out, collapse = ""))
  }

  out <- .returnMarkdown(x, title = c("## ", "\n\n"),
                         authors = c("Authors: ", "\n\n"),
                         affiliations = c("Affiliations: ", "\n\n"),
                         version = "Version: ",
                         "date-released" = c(" (", ")"),
                         license = c(" | License: ", "\n\n"),
                         keywords = c("Keywords: ", "\n\n"),
                         "repository-code" = c("Code Repository: ", "\n\n"),
                         citation = "Citation: ")
  return(out)
}
