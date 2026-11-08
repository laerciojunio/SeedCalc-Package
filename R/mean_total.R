#' Mean seedling length
#'
#' Calculates the mean total length (shoot + root) of the seedlings.
#'
#' @inheritParams mean_pa
#' @return A numeric value.
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
#' mean_total(Seedling)
mean_total <- function(lengths) {
  mean(lengths[[3]] + lengths[[4]])
}
