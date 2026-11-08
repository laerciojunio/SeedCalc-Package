#' Mean Germination Time
#'
#' Calculates the Mean Germination Time (Labouriau, 1983):
#' \deqn{MGT = \sum n_i t_i / \sum n_i}
#'
#' @inheritParams GSI
#' @return A numeric value, in the same unit as `time`.
#' @references
#' Labouriau, L. G. (1983). Uma nova linha de pesquisa na fisiologia da
#' germinação das sementes. *Anais do XXXIV Congresso Nacional de Botânica*.
#' SBB, Porto Alegre, 11–50.
#' @seealso [MGR()]
#' @export
#'
#' @examples
#' time <- 1:10
#' nger <- c(0, 2, 4, 15, 25, 38, 45, 50, 50, 50)
#' MGT(time, nger)
MGT <- function(time, nger) {
  n <- non_cumulative(nger)
  sum(time * n) / nger[length(nger)]
}
