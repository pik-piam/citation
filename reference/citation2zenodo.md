# citation2zenodo

Converts an object of class citation into a .zenodo.json file. This file
is an (officially unsupported) method to provide ZENODO with metadata
information about the package and will overwrite the information ZENODO
would otherwise auto-generate from the repository.

## Usage

``` r
citation2zenodo(cit, folder = NULL)
```

## Arguments

- cit:

  an object of class citation as returned for instance by the function
  [`citation`](citation-package.md), or the name of a R package to be
  used as source.

- folder:

  a folder the file should be written to. If NULL the content is instead
  printed.

## Author

Jan Philipp Dietrich

## Examples

``` r
cit <- citation_doi("citation")
citation2zenodo(cit)
#> {
#>   "title": "citation: Software Citation Tools",
#>   "version": "0.13.1",
#>   "creators": [
#>     {
#>       "name": "Dietrich, Jan Philipp"
#>     },
#>     {
#>       "name": "Leoncio, Waldir"
#>     }
#>   ]
#> } 
```
