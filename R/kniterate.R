## ------------------------------------------------------------------------
#' Given the root of a package, knit .Rmd files into R code.
#'
#' @export
#'
kniterate = function( package_root = getwd() ){
  package_code_rmd = list.files( file.path(package_root, "R") )
  package_code_rmd = package_code_rmd[grep(".Rmd$", package_code_rmd, ignore.case = T)]
  package_code_r = gsub( package_code_rmd, pattern = "\\.Rmd", replacement = ".R", ignore.case = T)
  for(i in seq_along(package_code_r)){
    knitr::purl(file.path( "R", package_code_rmd[[i]] ), output = file.path( "R", package_code_r  [[i]] ) )
  }
}

