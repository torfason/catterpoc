
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

#' Construct a catter_b class
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

#' Construct a catter_c class
#' @export
catter_c <- function(x) {
  class(x) <- "catter_c"
  x
}

#' Print catter class (this one exported)
#' @export
print.catter_c <- function(x) {
  cat(x)
  invisible(x)
}

#' This is not a method
#' @export
some.period <- function(a, b, c) {
  NULL
}

#' This is not a method
#' @export
some_b.period_b <- function(a, b, c) {
  NULL
}

#' This could be a constructor
#' @export
period_b <- function() {
  NULL
}

#' Not a method
#' @export
b.test.period_b <- function(a, b, c) {
  NULL
}

#' A method
#'
#' Note that if this method were exported with a regular export tag, roxygen
#' would misdiagnose it as method t on class test.catter_a (because t exists as
#' a generic).
#'
#' @exportS3Method t.test catter_a
t.test.catter_a <- function(a, b, c) {
  NULL
}
