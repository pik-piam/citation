#' @title Convert from R DESCRIPTION into CFF
#' @description Converts an R package DESCRIPTION file to Citation File Format
#' @param descriptionFile Path and name of the DESCRIPTION file
#' @param export if `TRUE`, the output is saved as CITATION.cff
#' @return The package's DESCRIPTION file converted to CFF
#' @author Waldir Leoncio
#' @export
#' @seealso cff2r
#' @examples
#' descr <- system.file("DESCRIPTION", package = "citation")
#' r2cff(descr)
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
  # Makes sure the file passed to r2cff() exists
  if (!file.exists(descriptionFile)) {
    stop(descriptionFile, " file not found on the provided file path.")
  }

  # Creating proto files for CFF and DESCRIPTION -----------------------------
  desc <- desc::desc(descriptionFile)
  cff <- readLines(system.file("extdata", "CITATION-skeleton.cff", package = "citation"))

  # Placing CFF elements -----------------------------------------------------
  cff <- append2cff(cff, desc, "Title")
  cff <- append2cff(cff, desc, "Version")
  cff <- append2cff(cff, desc, c("Date", "Date/Publication"), "date-released")
  cff <- append(cff, "authors:")
  processedAuthors <- unlist(lapply(desc$get_authors(), processAuthor))
  cff <- append(cff, processedAuthors)
  validateCFF(cff)

  # Returning CFF file -------------------------------------------------------
  if (!export) {
    return(cat(cff, sep = "\n"))
  } else {
    exportCFF(cff)
  }
}

append2cff <- function(cff, desc, field, cffField = tolower(field)) {
  # Finds a field in R DESCRIPTION and appends it to the CFF file

  # Trying to find a field containing values ---------------
  value <- NA
  for (f in field) {
    if (!is.na(desc$get(f))) {
      value <- desc$get(f)
    }
  }

  # Appending value and returning full CFF file (so far) ---
  if (!is.na(value)) {
    if (grepl("date", cffField, ignore.case = TRUE)) {
      # Formatting dates as ISO 8601 ---------------------------
      value <- as.Date(as.Date(value), format = "%Y-%M-%D")
    }
    cff <- append(cff, paste0(cffField, ": ", value, collapse = ""))
  }
  return(cff)
}

exportCFF <- function(infile, outfile = "CITATION.cff") {
  # Writes the created CFF file to the working directory
  outfile <- "CITATION.cff"
  if (file.exists(outfile)) {
    existingFile <- outfile
    outfile <- tempfile(pattern = "CITATION_", tmpdir = ".", fileext = ".cff")
    message(existingFile, " already exists. Saving as ", outfile)
  }
  writeLines(infile, outfile)
}

validateCFF <- function(cffFile) {
  # Checks if a CFF file contains all mandatory fields
  requiredFields <- data.frame(
    cff = c("authors", "date-released", "title", "version"),
    r = c("person", "Date", "Title", "Version")
  )
  for (f in requiredFields$cff) {
    if (!any(grepl(pattern = f, x = cffFile))) {
      rEquivalent <- requiredFields$r[match(f, requiredFields$cff)]
      warning(
        f, " not found. It is a CFF 1.1.0 required field.\n",
        "Please add a '", rEquivalent, "' field to your input file."
      )
    }
  }
}

processAuthor <- function(author) {
  # Parses the output of desc::desc_get_author to isolate fields
  author <- as.character(author) # it comes as "person" class
  roles <- gsub(".+\\[(.+)\\]$", "\\1", author)
  if (grepl("cph", roles)) {
    # Assumes "cph" belongs to an organization (see ?person for reason)
    name <- gsub("\\s\\[.+$", "", author)
    personOut <- paste(" - name:", name)
  } else {
    authorSplit <- strsplit(author, " ")[[1]]
    personOut <- c(
      paste(" - family-names:", authorSplit[2]),
      paste("   given-names:", authorSplit[1])
    )
  }
  return(personOut)
}
