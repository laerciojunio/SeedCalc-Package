#' Seedling uniformity index (Sako)
#'
#' Calculates the seedling uniformity index (Sako, 2001). Seedlings with
#' total length equal to zero are considered dead and penalize the index.
#'
#' @inheritParams mean_pa
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
#' unif_1(Seedling)
unif_1 <- function(lengths) {
  lengths_total <- lengths[[3]] + lengths[[4]]
  lengths_alive <- lengths_total[lengths_total > 0]

  ndeads <- length(lengths_total) - length(lengths_alive)
  desv <- sum(abs(lengths_alive - mean(lengths_total)))
  penalty <- ndeads * (50 / length(lengths_total))

  (1 - desv / (length(lengths_alive) * mean(lengths_alive))) * 1000 - penalty
}
