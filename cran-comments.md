## Test environments
* local R installation, R 3.6.3
* ubuntu 16.04 (on travis-ci), R 3.6.3
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is an updated version of the last upload fixing the issues highlighted by Swetlana Herbrandt (thanks for checking and your feedback!):

** "Thanks, please write package names, software names and API names in single quotes (e.g. 'utils') in your Description."
  DONE!
  
** "Please add '()' behind all function names (e.g. citation() without quotation marks) in your Description text."
  DONE!

** Please ensure that your functions do not modify (save or delete) the user's home filespace in your examples/vignettes/tests. That is not allow by CRAN policies. Please only write/save files if the user has specified a directory. In your examples/vignettes/tests you can write to tempdir(). The user should always have the possibility to write the files to a folder he/she wants to.
  I checked the code and made sure that no examples (vignettes and tests are currently absent in this package) write any files. The functions package2zenodo and citation2zenodo do write files, but only if the input argument contains valid path information (which is never the case in the given examples). I extended the documentation of that feature to clarify when files are written and when not.

