context("Converting CFF to DESCRIPTION")

# Finding files for testing ============================== #
findCFF <- function(pack, filename) {
  path <- system.file(package = pack)
  file <- file.path(path, filename)
  return(file)
}
citation <- findCFF("citation", "CFF-CITATION.cff")

# Testing ================================================ #
test_that("r2cff generally works", {
	expect_output(cff2r(citation), "Authors@R")
})
