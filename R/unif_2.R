#' Seedling uniformity index (Castan et al.)
#'
#' Calculates the seedling uniformity index (Christiansen, 1942; adapted by
#' Castan et al., 2018), based on the standard deviations of shoot, root and
#' total lengths and of the root/shoot ratio.
#'
#' @inheritParams mean_pa
#' @return A numeric value.
#' @references
#' Castan, D. O. C., Gomes-Junior, F. G., Marcos-Filho, J. (2018). Vigor-S, a
#' new system for evaluating the physiological potential of maize seeds.
#' *Scientia Agricola*, 75(2), 167–172. \doi{10.1590/1678-992x-2016-0401}
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
#' unif_2(Seedling)
unif_2 <- function(lengths) {
  shoot <- lengths[[3]]
  root <- lengths[[4]]

  razao <- ifelse(shoot > 0, root / shoot, 0)

  1000 - (0.75 * sd(shoot) + 0.5 * sd(root) + 2.5 * sd(shoot + root) +
    50 * sd(razao))
}
