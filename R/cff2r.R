#' @title Convert from CFF into R
#' @description Converts a CFF file into DESCRIPTION
#' @param cffFile Path and name of the CFF file
#' @param export if `TRUE`, the output is saved as DESCRIPTION (plus an extension to avoid overwriting)
#' @param ... when \code{export = TRUE}, the user can pass additional arguments
#' to the \code{exportDESCRIPTION} function. More information in the Details
#' section.
#' @return A CFF file converted to a DESCRIPTION file.
#' @author Waldir Leoncio
#' @export
#' @examples
#' \dontrun{
#' # Printing converted file onto R session
#' citation_file <- system.file("CFF-CITATION.cff", package = "citation")
#' cff2r(citation_file)
#'
#' # Saving converted file to temporary folder on system
#' tempFolder <- tempdir()
#' cff2r(
#'  citation_file, export = TRUE, outname = "converted-desc", overwrite = TRUE,
#'  outpath = tempFolder
#' )
#'
#' # Making sure the file is indeed there
#' cat(readLines(file.path(tempFolder, "converted-desc")), sep="\n")
#' }
#' @details
#' CFF is a standard format for the citation of software proposed by
#' Stephan Druskat et. al. (see references below). CFF-compliant files are
#' stored in files named CITATION.cff.
#'
#' CITATION.cff files are plain text files with human- and machine-readable
#' citation information for software. Code developers can include them in their
#' repositories to let others know how to correctly cite their software.
#'
#' When \code{export = TRUE}, the user can use the following arguments
#' to customize the output file:
#' \describe{
#'  \item{outname}{The name of the exported file}
#'  \item{overwrite}{Defaults to \code{FALSE}. If \code{TRUE}, will replace any
#'    homonymous file present on the export path}
#'  \item{outpath}{By default, the file is saved to a temporary directory. One
#'    may provide a different path here. For example, \code{outpath = "."} will
#'    save to the current working directory}
#' }
#' @references
#' Druskat S., Spaaks J.H., Chue Hong N., Haines R., Baker J. (2019).
#' Citation File Format (CFF) (version 1.1.0).
#' DOI: http://doi.org/10.5281/zenodo.1003149
#'
#' https://www.software.ac.uk/blog/2017-12-12-standard-format-citation-files
#' https://citation-file-format.github.io
#' https://github.com/citation-file-format/citation-file-format/blob/master/README.md
#' https://citation-file-format.github.io/cff-initializer-javascript/
#' @seealso r2cff
#' @importFrom desc description
cff2r <- function(cffFile = "CITATION.cff", export = FALSE, ...) {
  validateFile(cffFile)

  # Creating proto files for CFF and DESCRIPTION -----------------------------
  desc <- description$new("!new")
  cff  <- read_cff(cffFile)

  # Placing DESCRIPTION elements ---------------------------------------------
  desc <- desc$set("Title", cff$title)
  desc <- desc$set("Version", cff$version)
  desc <- desc$set("Description", cff$message)
  desc <- desc$set("Date", cff$`date-released`)
  addAuthors(cff$authors, desc)
  suppressMessages(desc$del_author("Jo", "Doe"))

  # Removing empty elements + Encoding ---------------------------------------
  descChar <- desc$str()
  descChar <- gsub("\\{\\{\\s\\w+\\s\\}\\}", "", descChar)
  descChar <- gsub("\\[3\\dmEncoding.+$", "", descChar)

  # Returning DESCRIPTION file -----------------------------------------------
  if (!export) {
    cat(descChar)
  } else {
    exportDESCRIPTION(descChar, ...)
  }
}

exportDESCRIPTION <- function(
  infile, outname = "DESCRIPTION", overwrite = FALSE, outpath = tempdir()
) {
  # Writes the created CFF file to the working directory

  # Determine the name of the output file ------------------------------------
  if (file.exists(file.path(outpath, outname))) {
    outnameOld <- outname # Saving previous name to use in the messages below
    outname <- tempfile(pattern = paste0(outname, "_"), tmpdir = ".")
    if (overwrite) {
      message(outnameOld, " already exists. Overwriting as requested.")
      outname <- outnameOld
    } else {
      message(outnameOld, " already exists. Saving under a different filename.")
    }
  }

  # Parsing file -------------------------------------------------------------
  infile <- gsub("\\[3\\dm", "", infile)
  infile <- gsub("\033", "", infile, fixed = TRUE)

  # Printing and exporting file ----------------------------------------------
  writeLines(text = infile, con = file.path(outpath, outname))
  message("Saved as ", normalizePath(file.path(outpath, outname)))
}

validateFile <- function(file) {
  # Makes sure the file exists
  if (!file.exists(file)) {
    stop(file, " file not found on the provided file path.")
  }
}

addAuthors <- function(authors, desc) {
  # Parses the authors field of a load_cff() file into desc$add_author
  for (author in authors) {
    isPerson <- any(grepl("family", names(author)))
    if (isPerson) {
      desc$add_author(
        author$`given-names`,
        author$`family-names`,
        email = author$email
      )
    } else {
      desc$add_author(author$name)
    }
  }
}
