# package2zenodo

Creates a .zenodo.json for a R package. This file is an (officially
unsupported) method to provide ZENODO with metadata information about
the package and will overwrite the information ZENODO would otherwise
auto-generate from the repository.

## Usage

``` r
package2zenodo(package = ".")
```

## Arguments

- package:

  either the path to the main folder of a package (containing a
  DESCRIPTION file) or the name of the package. If a path is provided
  the .zenodo.json file will be directly added to the folder. Otherwise
  the content of such a file is just returned.

## Value

The metadata information that should be provided to Zenodo in JSON
format.

## Author

Jan Philipp Dietrich

## Examples

``` r
package2zenodo("citation")
#> {
#>   "title": "citation: Software Citation Tools",
#>   "version": "0.13.1",
#>   "description": "<p>A collection of functions to extract citation information from 'R' packages and to deal with files in 'citation file format' (<https://citation-file-format.github.io/>), extending the functionality already provided by the citation() function in the 'utils' package.<\/p>",
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
