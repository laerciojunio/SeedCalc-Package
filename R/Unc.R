#' Germination Uncertainty
#'
#' Calculates the germination uncertainty index, \eqn{U}, in bits
#' (Labouriau & Valadares, 1976).
#'
#' @inheritParams GSI
#' @return A numeric value.
#' @references
#' Labouriau, L. G., Valadares, M. B. (1976). On the germination of seeds of
#' *Calotropis procera*. *Anais da Academia Brasileira de Ciências*, 48,
#' 174–186.
#' @export
#'
#' @examples
#' time <- 1:10
#' nger <- c(0, 2, 4, 15, 25, 38, 45, 50, 50, 50)
#' Unc(time, nger)
Unc <- function(time, nger) {
  n <- non_cumulative(nger)
  f <- n / sum(n)
  f <- f[f > 0]
  -sum(f * log2(f))
}
