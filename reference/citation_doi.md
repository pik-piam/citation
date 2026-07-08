# citation_doi

Extension of the standard citation function which also extracts DOI
information from the URL field in the DESCRIPTION file, if available.

## Usage

``` r
citation_doi(package)
```

## Arguments

- package:

  a character string with the name of a single package.

## Author

Jan Philipp Dietrich

## Examples

``` r
citation_doi("citation")
#> Dietrich J, Leoncio W (2026). _citation: Software Citation
#> Tools_. R package version 0.13.1.
```
