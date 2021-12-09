test_that("r2cff generally works", {
  citationFile <- system.file("CFF-CITATION.cff", package = "citation")
  expect_output(cff2r(citationFile), "Authors@R")
})
