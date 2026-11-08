#' Final Germination Percentage
#'
#' Calculates the final germination percentage, \eqn{FGP = n / N \times 100},
#' where \eqn{n} is the number of germinated seeds and \eqn{N} is the total
#' number of seeds.
#'
#' @param nger A numeric vector with the cumulative number of seeds
#'   germinated at each evaluation time.
#' @param Nseeds The total number of seeds used in the germination or
#'   emergence test.
#'
#' @return A numeric value: the final germination percentage.
#' @export
#'
#' @examples
#' nger <- c(0, 2, 4, 15, 25, 38, 45, 50, 50, 50)
#' FGP(nger, 50)
FGP <- function(nger, Nseeds) {
  max(nger) / Nseeds * 100
}
