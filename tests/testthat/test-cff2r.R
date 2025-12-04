test_that("cff2r generally works", {
  citationFile <- system.file("CFF-CITATION.cff", package = "citation")
  testthat::skip_if(!file.exists(citationFile))
  withr::with_tempdir({
  exportName <- "testExport"
    expect_output(cff2r(citationFile), "Authors@R")
    expect_message(
      cff2r(citationFile, export = TRUE, outname = exportName, outpath = "."),
      paste("Saved as", normalizePath(file.path(getwd(), exportName))),
      fixed = TRUE
    )
    expect_message(
      cff2r(citationFile, export = TRUE, outname = exportName, outpath = "."),
      "testExport already exists. Saving under a different filename."
    )
    expect_message(
      cff2r(
        citationFile, export = TRUE, outname = exportName, outpath = ".",
        overwrite = TRUE
      ),
      "testExport already exists. Overwriting as requested."
    )
  })
})
