test_that("r2cff generally works", {
  citationFile <- system.file("CFF-CITATION.cff", package = "citation")
  tempPath <- withr::local_tempdir()
  exportName <- "testExport"
  expect_output(cff2r(citationFile), "Authors@R")
  expect_message(
    cff2r(citationFile, export = TRUE, outname = exportName, outpath = tempPath),
    paste("Saved as", normalizePath(file.path(tempPath, exportName))),
    fixed = TRUE
  )
  expect_message(
    cff2r(citationFile, export = TRUE, outname = exportName, outpath = tempPath),
    "testExport already exists. Saving under a different filename."
  )
  expect_message(
    cff2r(
      citationFile, export = TRUE, outname = exportName, outpath = tempPath,
      overwrite = TRUE
    ),
    "testExport already exists. Overwriting as requested."
  )
})
