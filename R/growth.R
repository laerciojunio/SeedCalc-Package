#' Seedling growth index
#'
#' Calculates the seedling growth index (Sako, 2001), a weighted sum of the
#' mean root and shoot lengths:
#' \deqn{Growth = 100 \times [w_r \bar{R} + (1 - w_r) \bar{S}]}
#' where \eqn{\bar{R}} and \eqn{\bar{S}} are the mean root and shoot
#' lengths. Only the root weight is given; the shoot weight is `1 - wr`, so
#' the two weights always sum to 1.
#'
#' @inheritParams mean_pa
#' @param wr Weight given to the root length, between 0 and 1. The shoot
#'   length receives `1 - wr`. Default is 0.9 (90% root, 10% shoot).
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
#' growth(Seedling, wr = 0.9)
growth <- function(lengths, wr = 0.9) {
  check_weight(wr)
  100 * (mean(lengths[[4]]) * wr + mean(lengths[[3]]) * (1 - wr))
}
