#' Germination Synchrony
#'
#' Calculates the germination synchrony index, \eqn{Z} (Primack, 1980).
#'
#' @inheritParams GSI
#' @return A numeric value between 0 and 1.
#' @references
#' Primack, R. B. (1980). Variation in the phenology of natural populations
#' of montane shrubs in New Zealand. *Journal of Ecology*, 68, 849–862.
#' \doi{10.2307/2259460}
#' @export
#'
#' @examples
#' time <- 1:10
#' nger <- c(0, 2, 4, 15, 25, 38, 45, 50, 50, 50)
#' Sinc(time, nger)
Sinc <- function(time, nger) {
  n <- non_cumulative(nger)
  sum(choose(n, 2)) / choose(sum(n), 2)
}
