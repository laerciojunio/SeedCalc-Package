#' Germination Uniformity
#'
#' Calculates the germination uniformity as the time between 10% and 90% of
#' the final germination: `T90(time, nger) - T10(time, nger)`.
#'
#' @inheritParams GSI
#' @return A numeric value, in the same unit as `time`.
#' @family time to germination
#' @export
#'
#' @examples
#' time <- 1:10
#' nger <- c(0, 2, 4, 15, 25, 38, 45, 50, 50, 50)
#' UnifG(time, nger)
UnifG <- function(time, nger) {
  T90(time, nger) - T10(time, nger)
}
