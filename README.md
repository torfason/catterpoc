
<!-- README.md is generated from README.Rmd. Please edit that file -->

# catterpoc

Test package (proof of concept) for behavior of import package for S3
methods. Installation not recommended except to test that behavior.

## Examples

Import from package

``` r
# catterpoc should not be loaded at start
testthat::expect_error(catter_a("hello"), "could not find function")

# catter_a
import::from(catterpoc, catter_a)
x <- catter_a("hello") 
x # print.catter_a not picked up
#> [1] "hello"
#> attr(,"class")
#> [1] "catter_a"

# catter_b
import::from(catterpoc, catter_b)
x <- catter_b("hello") 
x # print.catter_b NOT picked up either, even if .S3method was called
#> [1] "hello"
#> attr(,"class")
#> [1] "catter_b"

rm("catter_a", "catter_b", pos="imports")
```

Import from script/module

``` r
# catterpoc should not be loaded at start
testthat::expect_error(catter_a("hello"), "could not find function")

# catter_a (using import)
import::from("R/catter.R", "catter_a",  .character_only=TRUE)
x <- catter_a("hello") 
x # print.catter_a not picked up
#> [1] "hello"
#> attr(,"class")
#> [1] "catter_a"

# catter_b (using import)
import::from("R/catter.R", "catter_b",  .character_only=TRUE)
x <- catter_b("hello") 
x # Here, it is picked up correctly (because .S3method was called)
#> hello

rm("catter_a", "catter_b", pos="imports")
```

Use `library()` to load package

``` r
# catterpoc should not be loaded at start
testthat::expect_error(catter_a("hello"), "could not find function")

library(catterpoc)

x <- catter_a("hello") 
x # print.catter_a not picked up - calling .S3method is requirement even for regular package loads
#> [1] "hello"
#> attr(,"class")
#> [1] "catter_a"

x <- catter_b("hello") 
x # Here, it is picked up correctly (because .S3method was called)
#> hello
```
