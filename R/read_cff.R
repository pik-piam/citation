#' read_cff
#' 
#' Read a citation file format  file (https://citation-file-format.github.io/)
#' 
#' @param file path to the citation file
#' @author Jan Philipp Dietrich
#' @importFrom yaml read_yaml
#' @export

read_cff <- function(file) {
  cff <- read_yaml(file, fileEncoding="")
  if(is.numeric(cff$version)) cff$version <- format(cff$version,nsmall=1)
  return(cff)
}