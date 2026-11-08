#' Coefficient of Variation of the Germination Time
#'
#' Calculates the Coefficient of Variation of the Germination Time
#' (Carvalho et al., 2005), in percent.
#'
#' @inheritParams GSI
#' @return A numeric value (percentage).
#' @references
#' Carvalho, M. P., Santana, D. G., Ranal, M. A. (2005). Emergência de
#' plântulas de *Anacardium humile* A. St.-Hil. (Anacardiaceae) avaliada por
#' meio de amostras pequenas. *Revista Brasileira de Botânica*, 28(3),
#' 627–633. \doi{10.1590/S0100-84042005000300018}
#' @seealso [MGT()], [VarGer()]
#' @export
#'
#' @examples
#' time <- 1:10
#' nger <- c(0, 2, 4, 15, 25, 38, 45, 50, 50, 50)
#' CVt(time, nger)
CVt <- function(time, nger) {
  sqrt(VarGer(time, nger)) / MGT(time, nger) * 100
}
