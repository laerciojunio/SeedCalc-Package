# SeedCalc

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/SeedCalc)](https://CRAN.R-project.org/package=SeedCalc)
[![R-CMD-check](https://github.com/laerciojunio/SeedCalc-Package/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/laerciojunio/SeedCalc-Package/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

SeedCalc provides functions to calculate seed germination, seedling
emergence and seedling growth indexes.

## Installation

Install the released version from CRAN:

``` r
install.packages("SeedCalc")
```

Or the development version from GitHub:

``` r
# install.packages("pak")
pak::pak("laerciojunio/SeedCalc-Package")
```

## Germination indexes

`GermCalc()` takes a data frame whose first column is the evaluation time and
whose other columns are the cumulative number of germinated seeds of each
replicate:

``` r
library(SeedCalc)

germdata <- data.frame(
  time = 1:10,
  rep1 = c(0, 2, 4, 15, 25, 38, 45, 50, 50, 50),
  rep2 = c(0, 4, 6, 18, 22, 39, 40, 48, 50, 50)
)

GermCalc(germdata, NSeeds = 50)
```

Each index is also available on its own: `FGP()`, `GSI()`, `T10()`, `T50()`,
`T90()`, `UnifG()`, `MGT()`, `MGR()`, `VarGer()`, `CVt()`, `Sinc()`, `Unc()`
and `CVG()`.

## Seedling indexes

`PlantCalc()` takes a data frame with two identification columns (e.g. lot
and replicate), shoot length and root length:

``` r
seedling <- data.frame(
  LOTE = c(1, 1, 1, 1, 2, 2, 2, 2),
  REP  = c(1, 1, 2, 2, 1, 1, 2, 2),
  SH   = c(0.00, 2.77, 0.80, 2.65, 0.64, 2.77, 0.80, 2.65),
  ROOT = c(4.86, 6.71, 9.68, 8.88, 4.86, 6.71, 9.68, 8.88)
)

PlantCalc(seedling)

# 80% root / 20% shoot; 60% growth / 40% uniformity
PlantCalc(seedling, wr = 0.8, wg = 0.6)
```

Individual indexes: `mean_pa()`, `mean_raiz()`, `mean_total()`,
`mean_razao()`, `growth()`, `unif_1()`, `unif_2()` and `vigor()`.
