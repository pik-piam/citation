# cff2md

Creates a summary of the CFF content in markdown format. This can be
useful for instance to create software reports.

## Usage

``` r
cff2md(x, headingLevel = 2)
```

## Arguments

- x:

  path to citation file or read in citation in citation file format

- headingLevel:

  integer (1–6); controls the Markdown heading level used for the entry
  title. Default is 2 (i.e. `##`). Use a higher value when embedding
  records inside a larger document with its own section headings.

## Author

Jan Philipp Dietrich
