# Finding description files for testing ==================
findDesc <- function(pack) {
  path <- system.file(package = pack)
  file <- file.path(path, "DESCRIPTION")
  return(file)
}
descFile     <- findDesc("desc")
utilsFile    <- findDesc("utils")
yamlFile     <- findDesc("yaml")
jsonliteFile <- findDesc("jsonlite")
covrFile     <- findDesc("covr")

# Testing ================================================
test_that("r2cff generally works", {
  expect_output(r2cff(descFile), "cff-version")
  expect_output(r2cff(jsonliteFile), "cff-version")
  expect_output(r2cff(covrFile), "cff-version")
  expect_error(r2cff(utilsFile))
  expect_error(r2cff(yamlFile))
})

test_that("Exporting works", {
  expect_invisible(r2cff(descFile, export = TRUE))
  expect_message(r2cff(descFile, export = TRUE), "CITATION.cff already exists")
  filesToRemove <- list.files(pattern = "CITATION")
  file.remove(filesToRemove)
})

test_that("Exceptions are properly handled", {
  expect_error(r2cff("inexistent_file"), "file not found")
  tempFile <- tempfile()
  writeLines(readLines(descFile)[-2], tempFile)
  expect_warning(r2cff(tempFile, export = TRUE), "title not found.")
  file.remove(tempFile, "CITATION.cff")
})
