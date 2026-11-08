## Resubmission of an archived package

SeedCalc was archived on 2025-07-10 because the issues reported by the CRAN
checks were not corrected in time. This release (2.0.0) fixes all of them:

* Added an `Authors@R` field to `DESCRIPTION`.
* DOIs in the `Description` field are now written as `<doi:prefix/suffix>`.
* Removed `LazyData`, as the package has no `data` directory.

The package was also modernised: documentation is now generated with
roxygen2, every exported function documents its return value, and a
testthat test suite was added. A few function arguments changed and one
function (`vigor_corr()`) was removed; these changes are listed in
`NEWS.md`. Because the package was archived, it has no reverse dependencies
on CRAN.

## Test environments

* local: Ubuntu 26.04 (Docker, rocker/tidyverse), R 4.6.2

## R CMD check results

0 errors | 0 warnings | 1 note

* checking CRAN incoming feasibility ... NOTE

  New submission

  Package was archived on CRAN

  This is expected: it is a resubmission of a package archived on
  2025-07-10. The issues that caused the archival are fixed (see above).

## Reverse dependencies

None (the package is currently archived).
