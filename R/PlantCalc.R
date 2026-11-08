#' Calculate all seedling indexes
#'
#' Calculates all seedling indexes provided by the package for each
#' combination of the two identification columns (e.g. treatment and
#' replicate) of `lengths`.
#'
#' @inheritParams growth
#' @inheritParams vigor
#'
#' @return A `data.frame` with the two identification columns followed by
#'   `mean_pa`, `mean_raiz`, `mean_total`, `mean_razao`, `Unif_1`,
#'   `Unif_2`, `Growth` and `Vigor`.
#' @family seedling indexes
#' @export
#'
#' @examples
#' Seedling <- data.frame(
#'   LOTE = c(1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2),
#'   REP = c(1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 2, 2, 2, 2),
#'   SH = c(0.00, 2.77, 1.18, 1.07, 0.80, 2.65, 3.51, 0.64, 2.77, 1.18, 1.07,
#'          0.80, 2.65, 3.51, 1.98),
#'   ROOT = c(4.86, 6.71, 7.88, 3.68, 9.68, 8.88, 9.85, 4.86, 6.71, 7.88, 3.68,
#'            9.68, 8.88, 9.85, 8.75)
#' )
#' PlantCalc(Seedling)
#'
#' # 80% root / 20% shoot; 60% growth / 40% uniformity
#' PlantCalc(Seedling, wr = 0.8, wg = 0.6)
PlantCalc <- function(lengths, wr = 0.9, wg = 0.7, Unif = 1) {
  check_weight(wr)
  check_weight(wg)
  rows <- list()

  for (trat in levels(as.factor(lengths[[1]]))) {
    lengths_trat <- lengths[lengths[[1]] == trat, , drop = FALSE]

    for (rep in levels(as.factor(lengths_trat[[2]]))) {
      x <- lengths_trat[lengths_trat[[2]] == rep, , drop = FALSE]

      rows[[length(rows) + 1]] <- data.frame(
        trat = trat,
        rep = rep,
        mean_pa = mean_pa(x),
        mean_raiz = mean_raiz(x),
        mean_total = mean_total(x),
        mean_razao = mean_razao(x),
        Unif_1 = unif_1(x),
        Unif_2 = unif_2(x),
        Growth = growth(x, wr = wr),
        Vigor = vigor(x, wg = wg, Unif = Unif, wr = wr)
      )
    }
  }

  result <- do.call(rbind, rows)
  names(result)[1:2] <- names(lengths)[1:2]
  result
}
