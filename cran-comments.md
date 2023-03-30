## changes

* expanded metadata coverage in r2cff
* added scanRepos and cffReport

## Test environments
* local R installation, R 4.1.2
* rhub Ubuntu Linux 20.04.1 LTS, R-release, GCC
* rhub Windows Server 2022, R-devel, 64 bit
* rhub Fedora Linux, R-devel, clang, gfortran

## R CMD check results

Rhub Windows devel: 

0 errors | 0 warnings | 1 note

* checking for detritus in the temp directory ... NOTE
Found the following files/directories:
  'lastMiKTeXException'
  
Rhub Fedora Linux:

* checking HTML version of manual ... NOTE
Skipping checking HTML validation: no command 'tidy' found  
  
All other systems:

0 errors | 0 warnings | 0 note

To my understanding the issue on Rhub Windows devel seems to be a problem with the local MikTex installation on the server as it does not occur on other test machines and as I could not reproduce the problem myself. In addition, there are no direct calls to miktex so that the temporary directory seems to be created by some other tools. Similarly, the issue on Fedora seems to be a problem of the test machine unrelated to the package.
