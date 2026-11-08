# Internal helpers ----------------------------------------------------------

# Converts cumulative germination counts into the number of seeds germinated
# at each evaluation time.
non_cumulative <- function(nger) {
  c(nger[1], diff(nger))
}

# Time to reach `pct` percent of the final germination, by linear
# interpolation between the two counts that bracket the target value
# (adapted from Farooq et al., 2005).
time_to_pct <- function(time, nger, pct) {
  target <- max(nger) * pct / 100

  ni <- max(nger)
  ti <- max(time)
  for (i in rev(seq_along(time))) {
    if (ni > target) {
      ni <- nger[i]
      ti <- time[i]
    }
  }

  nj <- min(nger)
  tj <- min(time)
  for (j in seq_along(time)) {
    if (nj < target) {
      nj <- nger[j]
      tj <- time[j]
    }
  }

  # The target count was observed exactly: no interpolation is needed, and
  # the result is the first time at which it was reached.
  if (nj == ni && nj > 0) {
    return(tj)
  }

  ti + ((target - ni) * (tj - ti)) / (nj - ni)
}

# Selects the seedling uniformity index used by `vigor()`.
unif_index <- function(lengths, Unif) {
  if (identical(as.numeric(Unif), 1)) {
    unif_1(lengths)
  } else if (identical(as.numeric(Unif), 2)) {
    unif_2(lengths)
  } else {
    stop("`Unif` must be 1 or 2.", call. = FALSE)
  }
}

# Validates a weight given as a proportion. Its complement (1 - x) is used
# for the other component, so both always sum to 1.
check_weight <- function(x, arg = deparse(substitute(x))) {
  if (!is.numeric(x) || length(x) != 1 || is.na(x) || x < 0 || x > 1) {
    stop(
      "`", arg, "` must be a single number between 0 and 1 ",
      "(the complementary weight is computed as 1 - ", arg, ").",
      call. = FALSE
    )
  }
  invisible(x)
}
