#' Time to 90 percent germination
#'
#' Calculates the time required to reach 90% of the final germination, by
#' linear interpolation (adapted from Farooq et al., 2005).
#'
#' @inheritParams GSI
#' @return A numeric value, in the same unit as `time`.
#' @references
#' Farooq, M., Basra, S. M. A., Ahmad, N., Hafeez, K. (2005). Thermal
#' hardening: a new seed vigor enhancement tool in rice. *Journal of
#' Integrative Plant Biology*, 47(2), 187–193.
#' \doi{10.1111/j.1744-7909.2005.00031.x}
#' @family time to germination
#' @export
#'
#' @examples
#' time <- 1:10
#' nger <- c(0, 2, 4, 15, 25, 38, 45, 50, 50, 50)
#' T90(time, nger)
T90 <- function(time, nger) {
  time_to_pct(time, nger, 90)
}
