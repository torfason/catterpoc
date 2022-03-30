
<!-- README.md is generated from README.Rmd. Please edit that file -->

# catterpoc

Test package (proof of concept) for behavior of import package for S3
methods. Installation not recommended except to test that behavior.

## Examples

Use `library()` to load package

``` r
# catterpoc should not be loaded at start
testthat::expect_error(catter_a("hello"), "could not find function")

library(catterpoc)

x <- catter_a("hello") 
x # print.catter_a not picked up
#> [1] "hello"
#> attr(,"class")
#> [1] "catter_a"

x <- catter_b("hello") 
x # print.catter_b not picked up when loading package (even if .S3method was called)
#> [1] "hello"
#> attr(,"class")
#> [1] "catter_b"

x <- catter_c("hello") 
x # print.catter_c is picked up correctly (because it is correctly exported in NAMESPACE)
#> hello

# Detach
detach("package:catterpoc", unload=TRUE)
```

Import from package

``` r
# catterpoc should not be loaded at start
testthat::expect_error(catter_a("hello"), "could not find function")

import::from(catterpoc, catter_a, catter_b, catter_c)

x <- catter_a("hello") 
x # print.catter_a not picked up
#> [1] "hello"
#> attr(,"class")
#> [1] "catter_a"

x <- catter_b("hello") 
x # print.catter_b NOT picked up when importing from package (even if .S3method was called)
#> [1] "hello"
#> attr(,"class")
#> [1] "catter_b"

x <- catter_c("hello") 
x # print.catter_c is picked up correctly (because it is correctly exported in NAMESPACE)
#> hello

rm("catter_a", "catter_b", "catter_c", pos="imports")
```

Import from script/module

``` r
# catterpoc should not be loaded at start
testthat::expect_error(catter_a("hello"), "could not find function")

import::from("R/catter.R", "catter_a", "catter_b", "catter_c", .character_only=TRUE)

x <- catter_a("hello") 
x # print.catter_a not picked up
#> [1] "hello"
#> attr(,"class")
#> [1] "catter_a"

x <- catter_b("hello") 
x # Here, it is picked up correctly (because .S3method was called in the module)
#> hello

x <- catter_c("hello") 
# Here, print.catter_c gets picked up only because a function of that name got
# registered when loading the library, and it does not get detached even if package 
# has been unloaded. If this block is run in a fresh session, the print method
# does NOT get picked up.
x
#> hello

rm("catter_a", "catter_b", "catter_c", pos="imports")
```
