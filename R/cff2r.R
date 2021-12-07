#' @title Convert from CFF into R
#' @description Converts a CFF file into DESCRIPTION
#' @param cff_file Path and name of the CFF file
#' @param export if `TRUE`, the output is saved as DESCRIPTION (plus an extension to avoid overwriting)
#' @return A CFF file converted to a DESCRIPTION file of class \code{c("description", "R6")}. See the \code{desc} package for details on how to further modify fields.
#' @author Waldir Leoncio
#' @export
#' @examples
#' citation_file <- system.file("CFF-CITATION.cff", package="citation")
#' cff2r(citation_file)
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
#' @seealso r2cff
cff2r <- function(cff_file = "CITATION.cff", export = FALSE) {
	validateFile(cff_file)

	# Creating proto files for CFF and DESCRIPTION -----------------------------
	desc <- desc::description$new("!new")
	cff  <- read_cff(cff_file)

	# Placing DESCRIPTION elements ---------------------------------------------
	desc <- desc$set("Title", cff$title)
	desc <- desc$set("Version", cff$version)
	desc <- desc$set("Description", cff$message)
	desc <- desc$set("Date", cff$date)
	addAuthors(cff$authors, desc)
	desc$del_author("Jo", "Doe")
	#TODO: unparse Authors@R so they have the canonical format

	# Returning DESCRIPTION file -----------------------------------------------
	if (!export) {
		return(desc)
	} else {
		exportDESCRIPTION(desc)
	}
}

exportDESCRIPTION <- function(infile, outfile="CITATION.cff") {
	# Writes the created CFF file to the working directory
	outfile <- "DESCRIPTION"
	if (file.exists(outfile)) {
		outfile -> outfile_old
		outfile <- tempfile(pattern="DESCRIPTION_", tmpdir="", fileext="")
		outfile <- gsub(pattern="/", replacement="", x=outfile)
		message(outfile_old, " already exists. Saving as ", outfile)
	}
	out_file <- sink(outfile)
	print(infile) # FIXME: output is a mess
	sink(NULL)
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
		is_person <- any(grepl("family", names(author)))
		if (is_person) {
			desc$add_author(
				author$given,
				author$family,
				email=author$email
			)
			# TODO: parse ORCID. see str(desc) and add_orcid for details
		} else {
			desc$add_author(author$name)
		}
	}
}