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
  expect_output(r2cff("covr"), "cff-version")
})

test_that("Exporting works", {
  withr::with_tempdir({
    file.copy(descFile, ".")
    expect_message(r2cff(".", export = TRUE), "Added CITATION.cff file")
    expect_message(r2cff(".", export = TRUE), "Updated CITATION.cff file")
  })
})

test_that("Exceptions are properly handled", {
  expect_error(r2cff("inexistent_file"), "Cannot find DESCRIPTION")
})
