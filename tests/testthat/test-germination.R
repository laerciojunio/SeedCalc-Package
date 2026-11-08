test_that("final germination percentage", {
  expect_equal(FGP(nger1, 50), 100)
  expect_equal(FGP(nger1, 100), 50)
})

test_that("speed indexes", {
  expect_equal(GSI(time, nger1), 10.20833333, tolerance = 1e-8)
  expect_equal(GSI(time, nger2), 10.66507937, tolerance = 1e-8)
  expect_equal(MGT(time, nger1), 5.42)
  expect_equal(MGT(time, nger2), 5.46)
  expect_equal(MGR(time, nger1), 1 / 5.42)
  expect_equal(CVG(time, nger1), 18.45018450, tolerance = 1e-8)
  expect_equal(CVG(time, nger2), 18.31501832, tolerance = 1e-8)
})

test_that("time to percentage of germination", {
  expect_equal(T10(time, nger1), 3.090909091, tolerance = 1e-8)
  expect_equal(T10(time, nger2), 2.5)
  expect_equal(T50(time, nger2), 5.176470588, tolerance = 1e-8)
  expect_equal(T90(time, nger2), 7.625)
  expect_equal(UnifG(time, nger2), 7.625 - 2.5)
})

test_that("target count observed exactly returns its time (no NaN)", {
  # 25 and 45 are exactly 50% and 90% of the final count (50)
  expect_equal(T50(time, nger1), 5)
  expect_equal(T90(time, nger1), 7)
  expect_equal(UnifG(time, nger1), 7 - T10(time, nger1))

  # plateau at the target: first time it was reached
  expect_equal(T50(1:5, c(0, 10, 20, 20, 40)), 3)

  germdata <- data.frame(time, rep1 = nger1, rep2 = nger2)
  expect_false(anyNA(GermCalc(germdata, 50)))
})

test_that("homogeneity indexes", {
  expect_equal(VarGer(time, nger1), 2.330204082, tolerance = 1e-8)
  expect_equal(VarGer(time, nger2), 3.477959184, tolerance = 1e-8)
  expect_equal(CVt(time, nger1), 28.16421771, tolerance = 1e-8)
  expect_equal(CVt(time, nger2), 34.15620392, tolerance = 1e-8)
  expect_equal(Sinc(time, nger1), 0.1722448980, tolerance = 1e-8)
  expect_equal(Sinc(time, nger2), 0.1991836735, tolerance = 1e-8)
  expect_equal(Unc(time, nger1), 2.551058789, tolerance = 1e-8)
  expect_equal(Unc(time, nger2), 2.513727824, tolerance = 1e-8)
})

test_that("GermCalc combines all indexes per replicate", {
  germdata <- data.frame(time, rep1 = nger1, rep2 = nger2)
  res <- GermCalc(germdata, 50)

  expect_s3_class(res, "data.frame")
  expect_equal(rownames(res), c("rep1", "rep2"))
  expect_equal(
    colnames(res),
    c("FGP", "GSI", "T10", "T50", "T90", "UnifG", "MGT", "MGR", "VarGer",
      "CVt", "Sinc", "Unc", "CVG")
  )
  expect_equal(res["rep2", "T50"], T50(time, nger2))
  expect_equal(res["rep1", "CVG"], CVG(time, nger1))
})
