# Software Citation Tools

R package **citation**, version **0.4.1**

[![Travis build status](https://travis-ci.com/pik-piam/citation.svg?branch=master)](https://travis-ci.com/pik-piam/citation) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3813429.svg)](https://doi.org/10.5281/zenodo.3813429) 

## Purpose and Functionality

A collection of functions to extract citation information from R packages and to deal with files in citation file format (<https://citation-file-format.github.io/>), extending the functionality already provided by the citation function in the utils package.


## Installation

For installation of the most recent package version an additional repository has to be added in R:

```r
options(repos = c(CRAN = "@CRAN@", pik = "https://rse.pik-potsdam.de/r/packages"))
```
The additional repository can be made available permanently by adding the line above to a file called `.Rprofile` stored in the home folder of your system (`Sys.glob("~")` in R returns the home directory).

After that the most recent version of the package can be installed using `install.packages`:

```r 
install.packages("citation")
```

Package updates can be installed using `update.packages` (make sure that the additional repository has been added before running that command):

```r 
update.packages()
```

## Questions / Problems

In case of questions / problems please contact Jan Philipp Dietrich <dietrich@pik-potsdam.de>.

## Citation

To cite package **citation** in publications use:

Dietrich J (2020). _citation: Software Citation Tools_. doi: 10.5281/zenodo.3813429 (URL:
https://doi.org/10.5281/zenodo.3813429), R package version 0.4.1, <URL:
https://github.com/pik-piam/citation>.

A BibTeX entry for LaTeX users is

 ```latex
@Manual{,
  title = {citation: Software Citation Tools},
  author = {Jan Philipp Dietrich},
  year = {2020},
  note = {R package version 0.4.1},
  doi = {10.5281/zenodo.3813429},
  url = {https://github.com/pik-piam/citation},
}
```

