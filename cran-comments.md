## changes

* this release adds `r2cff` and `cff2r` which convert a package DESCRIPTION into
  a citation in cff format and vise versa.

## Test environments
* local R installation, R 3.6.3
* ubuntu 16.04 (on travis-ci), R 3.6.3
* win-builder (devel)
* rhub Windows Server 2022, R-devel, 64 bit
* rhub Ubuntu Linux 20.04.1 LTS, R-release, GCC
* rhub Fedora Linux, R-devel, clang, gfortran

## R CMD check results

Rhub Windows devel: 

0 errors | 0 warnings | 1 note

* checking for detritus in the temp directory ... NOTE
Found the following files/directories:
  'lastMiKTeXException'
  
All other systems:

0 errors | 0 warnings | 0 note

To my understanding the issue on Rhub Windows devel seems to be a problem with the local MikTex installation on the server as it does not occur on other test machines and as I could not reproduce the problem myself. In addition, there are no direct calls to miktex so that the temporary directory seems to be created by some other tools.