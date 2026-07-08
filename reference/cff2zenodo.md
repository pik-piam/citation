# cff2zenodo

Converter citation file format to .zenodo.json metadata file for proper
metadata input to Zenodo.

## Usage

``` r
cff2zenodo(x)
```

## Arguments

- x:

  path to citation file or read in citation in citation file format. If
  a path is provided the .zenodo.json information will be written
  directly to a .zenodo.json file in the corresponding folder. Otherwise
  the metadata will be just returned by the function.

## Value

The metadata information that should be provided to Zenodo in JSON
format.

## Author

Jan Philipp Dietrich
