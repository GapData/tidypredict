context("parsemodel")


df <- data.frame(x = c(1, 2, 5, 6 ,6), y = c(2, 3, 6, 5, 4))
m <- lm(x ~ y, df)
gm <- glm(x ~ y, df, family = "gaussian")

test_that("Returns a data frame", {
  expect_is(parsemodel(m), "data.frame")
  expect_is(parsemodel(gm), "data.frame")
})


pm <- parsemodel(m)
pgm <- parsemodel(gm)

test_that("It has the minium set of columns",{
  
  expect_equal(colnames(pm)[1], "labels")
  expect_equal(colnames(pm)[2], "vals")
  expect_equal(colnames(pm)[3], "type")
  expect_equal(colnames(pm)[4], "estimate")
  
  expect_equal(colnames(pgm)[1], "labels")
  expect_equal(colnames(pgm)[2], "vals")
  expect_equal(colnames(pgm)[3], "type")
  expect_equal(colnames(pgm)[4], "estimate")
})