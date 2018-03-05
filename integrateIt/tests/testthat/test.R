#from can only be two values
#rule must be either trap or simpsons
#x and y must be of the same length
#various tests to see if the output is right
#from must be values found in x

context("Trapezoid and Simpson's Rule")
test_that("x and y are of the same length", {
  expect_that(identical(length(x), length(y)))
})

test_that("Rule is designated as either 'Trap' or 'Simpsons'", {
  expect_error(addSquares("p"))
})

test_that("The class of the output is correct", {
  expect_is(addSquares(1,2), "Squares")
})


context("Subtracting squares")
test_that("squares subtract correctly", {
  expect_that(subtractSquares(9, 2),
              equals(new("Squares", square=(77), x = 9, y = 2)))
})

test_that("An error is produced when the input is incorrect" , {
  expect_error(subtractSquares("p"))
})

test_that("The class of the output is correct", {
  expect_is(subtractSquares(1,2), "Squares")
})



context("Multiplying squares")
test_that("squares multiply correctly", {
  expect_that(multiplySquares(3, 4),
              equals(new("Squares", square=(144), x = 3, y = 4)))
})

test_that("An error is produced when the input is incorrect" , {
  expect_error(subtractSquares("p"))
})

test_that("The class of the output is correct", {
  expect_is(subtractSquares(1,2), "Squares")
})