context("Converting DESCRIPTION to CFF")

# Finding description files for testing ==================
findDesc <- function(pack) {
  path <- system.file(package = pack)
  file <- file.path(path, "DESCRIPTION")
  return(file)
}
desc     <- findDesc("desc")
utils    <- findDesc("utils")
yaml     <- findDesc("yaml")
jsonlite <- findDesc("jsonlite")
covr     <- findDesc("covr")

# Testing ================================================
test_that("r2cff generally works", {
  expect_output(r2cff(desc), "cff-version")
  expect_output(r2cff(jsonlite), "cff-version")
  expect_output(r2cff(covr), "cff-version")
  expect_error(r2cff(utils))
  expect_error(r2cff(yaml))
})
