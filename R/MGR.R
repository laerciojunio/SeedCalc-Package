#' Mean Germination Rate
#'
#' Calculates the Mean Germination Rate (Labouriau, 1983), the reciprocal of
#' the mean germination time: `1 / MGT(time, nger)`.
#'
#' @inheritParams GSI
#' @return A numeric value.
#' @references
#' Labouriau, L. G. (1983). Uma nova linha de pesquisa na fisiologia da
#' germinação das sementes. *Anais do XXXIV Congresso Nacional de Botânica*.
#' SBB, Porto Alegre, 11–50.
#' @seealso [MGT()]
#' @export
#'
#' @examples
#' time <- 1:10
#' nger <- c(0, 2, 4, 15, 25, 38, 45, 50, 50, 50)
#' MGR(time, nger)
MGR <- function(time, nger) {
  1 / MGT(time, nger)
}
