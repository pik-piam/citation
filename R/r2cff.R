#' @title Convert from R DESCRIPTION into CFF
#' @description Converts an R package DESCRIPTION file to Citation File Format
#' @param descriptionFile Path and name of the DESCRIPTION file
#' @param descriptionFile either the path to a DESCIPTION file, the path to a main
#' folder of a package (containing a DESCRIPTION file) or the name of a package.
#' @param export if `TRUE`, the output is saved as CITATION.cff in the folder of
#' the DESCRIPTION file.
#' @return The package's DESCRIPTION file converted to CFF
#' @author Waldir Leoncio, Jan Philipp Dietrich
#' @export
#' @seealso cff2r
#' @examples
#' r2cff("citation")
#' @importFrom desc desc
#' @details
#' CFF is a standard format for the citation of software proposed by
#' Stephan Druskat et. al. (see references below). CFF-compliant files are
#' stored in files named CITATION.cff.
#'
#' CITATION.cff files are plain text files with human- and machine-readable
#' citation information for software. Code developers can include them in their
#' repositories to let others know how to correctly cite their software.
#' @references
#' Druskat S., Spaaks J.H., Chue Hong N., Haines R., Baker J. (2019).
#' Citation File Format (CFF) (version 1.1.0).
#' DOI: http://doi.org/10.5281/zenodo.1003149
#'
#' https://www.software.ac.uk/blog/2017-12-12-standard-format-citation-files
#' https://citation-file-format.github.io
#' https://github.com/citation-file-format/citation-file-format/blob/master/README.md
#' https://citation-file-format.github.io/cff-initializer-javascript/
r2cff <- function(descriptionFile = "DESCRIPTION", export = FALSE) {

  # read in DESCRIPTION information
  if (file.exists(descriptionFile)) {
    d <- desc(descriptionFile)
    folder <- sub("DESCRIPTION$", "", descriptionFile)
    if (folder == "") folder <- "."
  } else if (file.exists(file.path(descriptionFile, "DESCRIPTION"))) {
    d <- desc(file = file.path(descriptionFile, "DESCRIPTION"))
    folder <- descriptionFile
  } else {
    d <- desc(package = descriptionFile)
    folder <- NULL
  }

  # function to reformat authors
  .authors <- function(d) {
    out <- list()
    authors <- d$get_authors()
    for (i in seq_along(authors)) {
      out[[i]] <- list()
      if (is.null(authors[[i]]$family)) {
        out[[i]]$name <- authors[[i]]$given
      } else if (is.null(authors[[i]]$given)) {
        out[[i]]$name <- authors[[i]]$family
      } else {
        out[[i]][["family-names"]] <- authors[[i]]$family
        out[[i]][["given-names"]] <- authors[[i]]$given
      }
      if (!is.null(authors[[i]]$email)) {
        out[[i]]$email <- authors[[i]]$email
      }
      for(t in c("ORCID", "affiliation"))
      if (!is.null(authors[[i]]$comment[t]) && !is.na(authors[[i]]$comment[t])) {
        out[[i]][[tolower(t)]] <- unname(authors[[i]]$comment[t])
        if(t == "ORCID") {
          pattern <-  'https://orcid\\.org/[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{3}[0-9X]{1}'
          if(!grepl(pattern, out[[i]][[tolower(t)]])) {
            orcid <- out[[i]][[tolower(t)]]
            out[[i]][[tolower(t)]] <- paste0("https://orcid.org/", orcid)
            if(!grepl(pattern, out[[i]][[tolower(t)]])) {
              warning("ORCID ", orcid, " has invalid format!")
              out[[i]][[tolower(t)]] <- orcid
            }
          }
        }
      }
    }
    return(out)
  }

  # function to reformat license information
  .license <- function(d) {
    license <- d$get_field("License", default = NULL)
    # Fix common differences in license representation
    license <- sub("clause", "Clause", gsub("_", "-", sub(" [+|].*$", "", license)))
    license <- sub("GPL-3$", "GPL-3.0", license)
    return(license)
  }

  # function to reformat and distribute URLs
  .urls <- function(d) {
    out <- list()
    urls <- d$get_urls()
    for (url in urls) {
      if (grepl("doi.org", url)) {
        out$doi <- sub("^.*doi\\.org/", "", url)
      } else if (grepl("github.com", url)) {
        out$`repository-code` <- url
      } else {
        out$url <- c(out$url, url)
      }
    }
    return(out)
  }

  # create CFF output as list
  cff <- list(`cff-version` = "1.2.0",
              message = "If you use this software, please cite it using the metadata from this file.",
              type = "software",
              title = paste0(d$get("Package"), ": ", d$get("Title")),
              version = d$get_field("Version", default = NULL),
              `date-released` = d$get_field("Date", default = NULL),
              abstract = d$get_field("Description", default = NULL),
              authors = .authors(d),
              license = .license(d),
              keywords = d$get_field("Config/Keywords", default = NULL))

  # remove empty entries
  cff <- cff[!vapply(cff, is.null, logical(1))]

  # add URLs
  cff <- c(cff, .urls(d))

  # fix format issue with keywords
  if(length(cff$keywords) == 1) {
    cff$keywords <- c(cff$keywords, "DUMMYKEYWORD")
  }

  # convert to YAML format
  out <- yaml::as.yaml(cff)

  # remove dummykeyword used to force keywords entries
  # into array structure (as defined in CFF format)
  out <- sub("- DUMMYKEYWORD\n","",out)
  if (isTRUE(export) && !is.null(folder)) {
    cffFile <- file.path(folder, "CITATION.cff")
    if (file.exists(cffFile)) {
      message("Updated CITATION.cff file")
    } else {
      message("Added CITATION.cff file")
    }
    # enc2utf8 re-encodes out as utf8, encoding = "" and useBytes = TRUE prevent automatic re-encoding
    writeLines(enc2utf8(out), local_connection(file(cffFile, "w+", encoding = "")), useBytes = TRUE)

    rbuildignore <- file.path(folder, ".Rbuildignore")
    if (file.exists(rbuildignore)) {
      a <- readLines(rbuildignore)
      if (all(!grepl("CITATION.cff", a, fixed = TRUE))) {
        a <- c(a, "^.*CITATION.cff$")
        writeLines(a, rbuildignore)
        message("Added CITATION.cff to .Rbuildignore")
      }
    }
    invisible(out)
  } else {
    if (isTRUE(export)) warning("Could not export CITATION.cff file as folder package folder is not provided!")
    message(cat(out))
    invisible(out)
  }
}
