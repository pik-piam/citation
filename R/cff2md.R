#' cff2md
#'
#' Creates a summary of the CFF content in markdown format. This
#' can be useful for instance to create software reports.
#'
#' @param x path to citation file or read in citation in citation file format
#' @param headingLevel integer (1–6); controls the Markdown heading level used
#'   for the entry title. Default is 2 (i.e. \code{##}). Use a higher value
#'   when embedding records inside a larger document with its own section
#'   headings.
#' @author Jan Philipp Dietrich
#' @importFrom utils person bibentry
#' @export

cff2md <- function(x, headingLevel = 2) {
  if (is.null(x)) return(x)
  if (is.character(x) && (file.exists(x) || substring(x, 1, 4) == "http")) x <- read_cff(x)

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
    mandatoryFields <- c("authors", "cff-version", "message", "title")
    missing <- mandatoryFields[!(mandatoryFields %in% names(x))]
    for (i in names(args)) {
      if(is.null(x[[i]])) missing <- c(missing, i)
      if (is.na(args[[i]][2])) args[[i]][2] <- ""
      if (length(x[[i]]) > 1) x[[i]] <- paste(x[[i]], collapse = ", ")
      if (!is.null(x[[i]])) out <- c(out, paste0(args[[i]][1], x[[i]], args[[i]][2]))
    }

    if(length(missing) > 0) {
      missing <- unique(missing)
      if(!is.null(x$`repository-code`)) {
        name <- x$`repository-code`
      } else {
        name <- x$title
      }
      warning("Missing information for ", name, ": ", paste(missing, collapse=", "), call. = FALSE)
    }

    return(paste(out, collapse = ""))
  }

  heading <- paste0(strrep("#", headingLevel), " ")

  # Include type only when it conveys information beyond the obvious (software repo list)
  typeField <- if (!is.null(x$type) && !identical(x$type, "software")) {
    list(type = c("Type: ", "\n\n"))
  } else {
    list()
  }

  # Include website URL only when present and distinct from repository-code
  urlField <- if (!is.null(x$url) && !identical(x$url, x$`repository-code`)) {
    list(url = c("Website: ", "\n\n"))
  } else {
    list()
  }

  out <- do.call(.returnMarkdown, c(
    list(x),
    list(title        = c(heading, "\n\n"),
         abstract     = c("", "\n\n"),
         authors      = c("Authors: ", "\n\n"),
         affiliations = c("Affiliations: ", "\n\n"),
         version      = "Version: ",
         "date-released" = c(" (", ")"),
         license      = c(" | License: ", "\n\n")),
    typeField,
    list(keywords     = c("Keywords: ", "\n\n")),
    urlField,
    list("repository-code" = c("Code Repository: ", "\n\n"),
         citation     = "Citation: ")
  ))
  return(out)
}
