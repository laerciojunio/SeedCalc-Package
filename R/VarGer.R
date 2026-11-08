#' Variance of Germination Time
#'
#' Calculates the Variance of Germination Time (Labouriau, 1983).
#'
#' @inheritParams GSI
#' @return A numeric value.
#' @references
#' Labouriau, L. G. (1983). Uma nova linha de pesquisa na fisiologia da
#' germinação das sementes. *Anais do XXXIV Congresso Nacional de Botânica*.
#' SBB, Porto Alegre, 11–50.
#' @seealso [MGT()], [CVt()]
#' @export
#'
#' @examples
#' time <- 1:10
#' nger <- c(0, 2, 4, 15, 25, 38, 45, 50, 50, 50)
#' VarGer(time, nger)
VarGer <- function(time, nger) {
  n <- non_cumulative(nger)
  tm <- MGT(time, nger)
  sum(n * (time - tm)^2) / (sum(n) - 1)
}
