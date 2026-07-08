# cffReport

Creates a report in markdown format for a provided list of repositories
and or CITATION.cff files. The report starts with a compact summary
table followed by full per-entry records, and ends with a section
listing any repositories for which no `CITATION.cff` was found.

## Usage

``` r
cffReport(repos, file = NULL, sortBy = "title", headingLevel = 2)
```

## Arguments

- repos:

  character vector of repository urls or links to CITATION.cff files to
  be scanned

- file:

  character string naming a file the report should be written to. If
  NULL the report will be directly returned by the function.

- sortBy:

  category by which the report should sort its entries

- headingLevel:

  integer (1–6); Markdown heading level for individual entry titles
  passed through to [`cff2md`](cff2md.md). Default is 2 (`##`). Increase
  when embedding the output inside a larger document.

## Value

the report in markdown format

## Author

Jan Philipp Dietrich
