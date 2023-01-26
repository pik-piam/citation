## changes

* this release removes an import from utils::as.personList

## Test environments
* local R installation, R 4.1.2
* ubuntu 22.04.1 (on github actions), R 4.2.2 Patched
* rhub Windows Server 2022, R-devel, 64 bit

## R CMD check results

Rhub Windows devel: 

0 errors | 0 warnings | 1 note

* checking for detritus in the temp directory ... NOTE
Found the following files/directories:
  'lastMiKTeXException'
  
All other systems:

0 errors | 0 warnings | 0 note

To my understanding the issue on Rhub Windows devel seems to be a problem with the local MikTex installation on the server as it does not occur on other test machines and as I could not reproduce the problem myself. In addition, there are no direct calls to miktex so that the temporary directory seems to be created by some other tools.
