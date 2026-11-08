#' Calculate all germination indexes
#'
#' Calculates all seed germination (or seedling emergence) indexes provided
#' by the package for each replicate: [FGP()], [GSI()], [T10()], [T50()],
#' [T90()], [UnifG()], [MGT()], [MGR()], [VarGer()], [CVt()], [Sinc()],
#' [Unc()] and [CVG()].
#'
#' @param germdata A `data.frame`. The first column holds the evaluation
#'   times and each of the remaining columns holds the cumulative number of
#'   germinated seeds of one replicate.
#' @param NSeeds The total number of seeds per replicate used in the
#'   germination or emergence test.
#'
#' @return A `data.frame` with one row per replicate (named after the columns
#'   of `germdata`) and one column per index.
#' @export
#'
#' @examples
#' germdata <- data.frame(
#'   time = 1:10,
#'   rep1 = c(0, 2, 4, 15, 25, 38, 45, 50, 50, 50),
#'   rep2 = c(0, 4, 6, 18, 22, 39, 40, 48, 50, 50)
#' )
#' GermCalc(germdata, 50)
GermCalc <- function(germdata, NSeeds) {
  time <- germdata[[1]]
  indexes <- list(
    GSI = GSI, T10 = T10, T50 = T50, T90 = T90, UnifG = UnifG, MGT = MGT,
    MGR = MGR, VarGer = VarGer, CVt = CVt, Sinc = Sinc, Unc = Unc, CVG = CVG
  )

  rows <- lapply(germdata[-1], function(nger) {
    c(FGP = FGP(nger, NSeeds), vapply(indexes, function(f) f(time, nger), numeric(1)))
  })

  result <- as.data.frame(do.call(rbind, rows))
  rownames(result) <- colnames(germdata)[-1]
  result
}
