#' Coefficient of Velocity of Germination
#'
#' Calculates the Coefficient of Velocity of Germination (Nichols &
#' Heydecker, 1968): \eqn{CVG = \sum n_i / \sum (n_i t_i) \times 100}.
#'
#' @inheritParams GSI
#' @return A numeric value.
#' @references
#' Nichols, M. A., Heydecker, W. (1968). Two approaches to the study of
#' germination data. *Proceedings of the International Seed Testing
#' Association*, 33, 531–540.
#' @export
#'
#' @examples
#' time <- 1:10
#' nger <- c(0, 2, 4, 15, 25, 38, 45, 50, 50, 50)
#' CVG(time, nger)
CVG <- function(time, nger) {
  n <- non_cumulative(nger)
  sum(n) / sum(n * time) * 100
}
