
#' Construct a catter_a class
#' @export
catter_a <- function(x) {
  class(x) <- "catter_a"
  x
}

#' Print catter class (not exported)
print.catter_a <- function(x) {
  cat(x)
  invisible(x)
}

#' Construct a catter_a class
#' @export
catter_b <- function(x) {
  class(x) <- "catter_b"
  x
}

#' Print catter class (not exported)
print.catter_b <- function(x) {
  cat(x)
  invisible(x)
}

.S3method("print", "catter_b", print.catter_b) # It looks like methods are not limited to generic.class calls
