test_that("length summaries", {
  expect_equal(mean_pa(seedling), 1.772)
  expect_equal(mean_raiz(seedling), 7.455333333, tolerance = 1e-8)
  expect_equal(mean_total(seedling), 9.227333333, tolerance = 1e-8)
  expect_equal(mean_razao(seedling), 4.207298721, tolerance = 1e-8)
})

test_that("growth, uniformity and vigor indexes", {
  expect_equal(growth(seedling), 688.7)
  expect_equal(growth(seedling, wr = 0.8), 631.8666667, tolerance = 1e-8)
  expect_equal(unif_1(seedling), 748.8042771, tolerance = 1e-8)
  expect_equal(unif_2(seedling), 815.5576933, tolerance = 1e-8)
  expect_equal(vigor(seedling), 706.7312831, tolerance = 1e-8)
  expect_equal(vigor(seedling, wg = 0.6, Unif = 2), 739.4430773, tolerance = 1e-8)
})

test_that("invalid `Unif` is an error", {
  expect_error(vigor(seedling, Unif = 3), "`Unif` must be 1 or 2")
})

test_that("PlantCalc summarises by treatment and replicate", {
  res <- PlantCalc(seedling)

  expect_equal(dim(res), c(4, 10))
  expect_equal(
    names(res),
    c("LOTE", "REP", "mean_pa", "mean_raiz", "mean_total", "mean_razao",
      "Unif_1", "Unif_2", "Growth", "Vigor")
  )
  expect_equal(res$LOTE, c("1", "1", "2", "2"))
  expect_equal(res$REP, c("1", "2", "1", "2"))
  expect_equal(
    res$Vigor,
    c(577.9137611, 886.2172604, 587.8183388, 876.9670607),
    tolerance = 1e-8
  )
})

test_that("PlantCalc passes custom weights", {
  res <- PlantCalc(seedling, wr = 0.8, wg = 0.6, Unif = 2)

  expect_equal(res$Growth, c(487.7, 804.0, 490.9, 787.9))
  # vigor uses the same growth weights as the Growth column
  expect_equal(res$Vigor, 0.6 * res$Growth + 0.4 * res$Unif_2)
})

test_that("vigor() honours wr", {
  expect_equal(
    vigor(seedling, wr = 0.8),
    growth(seedling, wr = 0.8) * 0.7 + unif_1(seedling) * 0.3
  )
})

test_that("vigor_corr() and the `Ger` argument were removed", {
  expect_false(exists("vigor_corr", envir = asNamespace("SeedCalc")))
  expect_error(PlantCalc(seedling, Ger = 90), "unused argument")
})

test_that("only one weight of each pair is given; the other is 1 - w", {
  # growth: root weight wr, shoot weight 1 - wr (scaled by 100)
  expect_equal(
    growth(seedling, wr = 0.75),
    100 * (0.75 * mean_raiz(seedling) + 0.25 * mean_pa(seedling))
  )
  expect_equal(growth(seedling, wr = 1), 100 * mean_raiz(seedling))
  expect_equal(growth(seedling, wr = 0), 100 * mean_pa(seedling))

  # vigor: growth weight wg, uniformity weight 1 - wg
  expect_equal(vigor(seedling, wg = 1), growth(seedling))
  expect_equal(vigor(seedling, wg = 0, Unif = 2), unif_2(seedling))

  # the removed arguments are no longer accepted
  expect_error(growth(seedling, wh = 0.1), "unused argument")
  expect_error(vigor(seedling, wu = 0.3), "unused argument")
})

test_that("weights outside [0, 1] are an error", {
  expect_error(growth(seedling, wr = 90), "`wr` must be a single number between 0 and 1")
  expect_error(vigor(seedling, wg = 1.5), "`wg` must be a single number between 0 and 1")
  expect_error(vigor(seedling, wr = -0.1), "`wr`")
  expect_error(PlantCalc(seedling, wr = 90), "`wr`")
  expect_error(PlantCalc(seedling, wg = NA), "`wg`")
})
