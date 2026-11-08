#' Seed vigor index
#'
#' Calculates the seed vigor index (Sako, 2001), a weighted sum of the
#' seedling growth index and a seedling uniformity index:
#' \deqn{Vigor = w_g \times Growth + (1 - w_g) \times Uniformity}
#' Only the growth weight is given; the uniformity weight is `1 - wg`, so
#' the two weights always sum to 1.
#'
#' @inheritParams growth
#' @param wg Weight given to the seedling growth index, between 0 and 1. The
#'   uniformity index receives `1 - wg`. Default is 0.7.
#' @param Unif Uniformity index to use: `1` for [unif_1()] (default) or `2`
#'   for [unif_2()].
#'
#' @return A numeric value.
#' @references
#' Sako, Y., McDonald, M. B., Fujimura, K., Evans, A. F., Bennett, M. A.
#' (2001). A system for automated seed vigour assessment. *Seed Science and
#' Technology*, 29(3), 625–636.
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
#' vigor(Seedling, wg = 0.7, Unif = 1, wr = 0.9)
vigor <- function(lengths, wg = 0.7, Unif = 1, wr = 0.9) {
  check_weight(wg)
  growth(lengths, wr = wr) * wg + unif_index(lengths, Unif) * (1 - wg)
}
