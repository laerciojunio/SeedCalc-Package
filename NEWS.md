# SeedCalc 2.0.0

## Breaking changes

* `vigor_corr()` was removed, together with the `Vigor_corr` column and the
  `Ger` argument of `PlantCalc()`.
* Seedling index weights are now given as a single proportion per pair; the
  complementary weight is computed as `1 - w`, so the pair always sums to 1:
  * `growth()`, `vigor()` and `PlantCalc()`: `wr` (root weight) is now a
    proportion between 0 and 1 (default `0.9`) and `wh` was removed (shoot
    weight is `1 - wr`). `growth()` keeps the same scale: `wr = 0.9` gives
    the same result as the former `wr = 90, wh = 10`.
  * `vigor()` and `PlantCalc()`: `wu` was removed (uniformity weight is
    `1 - wg`).
  * Weights outside `[0, 1]` (e.g. the former `wr = 90`) are now an error.
* New signatures: `growth(lengths, wr = 0.9)`,
  `vigor(lengths, wg = 0.7, Unif = 1, wr = 0.9)` and
  `PlantCalc(lengths, wr = 0.9, wg = 0.7, Unif = 1)`.
* With the default weights all remaining results are unchanged.

## Bug fixes and other changes

* `vigor()` and `PlantCalc()` now apply `wr` to the growth component of the
  vigor index. Previously it always used the default root/shoot weights, so
  `PlantCalc()` ignored a custom root weight in the `Vigor` column.
* Fixed `T10()`, `T50()` and `T90()` (and therefore `UnifG()` and
  `GermCalc()`) returning `NaN` when the cumulative count reaches the target
  value exactly. They now return the first time at which the target was
  reached.
* Package infrastructure modernised: documentation is now generated with
  roxygen2 (Markdown), `NAMESPACE` is generated and exports functions
  explicitly, and `DESCRIPTION` uses `Authors@R`.
* Added a testthat (3rd edition) test suite and a GitHub Actions
  `R CMD check` workflow.
* Internal code was vectorised and simplified; all results are unchanged.
* `vigor()` and `PlantCalc()` now give an informative error when `Unif` is
  not 1 or 2.

# SeedCalc 1.0.0

* First CRAN release.
