#' @title Convert from R DESCRIPTION into CFF
#' @description Converts an R package DESCRIPTION file to Citation File Format
#' @param description_file Path and name of the DESCRIPTION file
#' @param export if `TRUE`, the output is saved as CITATION.cff
#' @return The package's DESCRIPTION file converted to CFF
#' @author Waldir Leoncio
#' @export
#' @examples
#' descr <- system.file("DESCRIPTION", package="citation")
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
r2cff <- function(description_file = "DESCRIPTION", export = FALSE) {
	validateR(description_file)

	# Creating proto files for CFF and DESCRIPTION -----------------------------
	desc     <- desc::desc(description_file)
	cff_path <- system.file("extdata", "CITATION-skeleton.cff", package="citation")
	cff      <- readLines(cff_path)

	# Placing CFF elements -----------------------------------------------------
	cff <- append2cff(cff, desc, "Title")
	cff <- append2cff(cff, desc, "Version")
	cff <- append2cff(cff, desc, "Date","date-released")
	cff <- append(cff, "authors:", )
	authors <- desc$get_authors()
	processed_author <- unlist(lapply(authors, processAuthor))
	cff <- append(cff, processed_author)
	validateCFF(cff)

	# Returning CFF file -------------------------------------------------------
	if (!export) {
		return(cat(cff, sep = "\n"))
	} else {
		exportCFF(cff)
	}
}

append2cff <- function(cff, desc, field, cff_field = tolower(field)) {
	# Finds a field in R DESCRIPTION and appends it to the CFF file
	value <- desc$get(field)
	if (!is.na(value)) {
		cff_txt <- paste(cff_field, ": ", value, collapse = "")
		cff <- append(cff, cff_txt)
	}
	return(cff)
}

exportCFF <- function(infile, outfile="CITATION.cff") {
	# Writes the created CFF file to the working directory
	outfile <- "CITATION.cff"
	if (file.exists(outfile)) {
		outfile -> outfile_old
		outfile <- tempfile(pattern="CITATION_", tmpdir="", fileext=".cff")
		outfile <- gsub(pattern="/", replacement="", x=outfile)
		message(outfile_old, " already exists. Saving as ", outfile)
	}
	writeLines(infile, outfile)
}

validateR <- function(r_file) {
	# Makes sure the file passed to r2cff() exists
	if (!file.exists(r_file)) {
		stop(r_file, " file not found on the provided file path.")
	}

}

validateCFF <- function(cff_file) {
	# Checks if a CFF file contains all mandatory fields
	required_fields <- data.frame(
		cff = c("authors", "date-released", "title", "version"),
		r = c("person", "Date", "Title", "Version")
	)
	for (f in required_fields$cff) {
		found_f <- grepl(pattern=f, x=cff_file)
		if (!any(found_f)) {
			r_equivalent <- required_fields$r[match(f, required_fields$cff)]
			warning(
				f, " not found. It is a CFF 1.1.0 required field.\n",
				"Please add a '", r_equivalent, "' field to your input file."
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
		person_out <- paste(" - name:", name)
	} else {
		author_split <- strsplit(author, " ")[[1]]
		given_name   <- author_split[1]
		family_name  <- author_split[2]
		person_out <- c(
			paste(" - family-names:", family_name),
			paste("   given-names:", given_name)
		)
	}
	return(person_out)
}
