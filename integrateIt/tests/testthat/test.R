#from can only be two values
#rule must be either trap or simpsons
#x and y must be of the same length
#various tests to see if the output is right
#from must be values found in x
#one must be even or odd or something like that 

context("integrateIt")
test_that("integrateIt is receiving the correct inputs (x = vector, y = vector, from = vector of min and max (x), Rule = character of 'Trap' or 'Simpsons'", {
  expect_error(integrateIt("p"))
})

test_that("Class of output is correct",{
  expect_is(integrateIt(x = c(1,2,3), y = c(1,4,9), from = c(1,3), Rule = "Trap"), 
            "Trapezoid")
})

test_that("Class of output is correct",{
  expect_is(integrateIt(x = c(1,2,3), y = c(1,4,9), from = c(1,3), Rule = "Simpsons"), "Simpsons")
})


test_that("the trapezoid rule portion of integrateIt returns the proper value", {
  expect_equal(integrateIt(x = c(1,2,3,4,5), y = c(1,4,9,16,25), from = c(1,5), Rule = "Trap")@result,
              42)
})


test_that("the Simpson's rule portion of integrateIt returns the proper value", {
  expect_equal(integrateIt(x = c(1,2,3,4,5), y = c(1,4,9,16,25), from = c(1,5), Rule = "Simpsons")@result,
              41.33333333333)
})

context("Printing")
test_that("Print produces the correct number",{
  expect_equal(as.character(integrateIt(x = c(1,2,3,4,5), y = c(1,4,9,16,25), from = c(1,5), Rule = "Trap")@result), 
            print(integrateIt(x = c(1,2,3,4,5), y = c(1,4,9,16,25), from = c(1,5), Rule = "Trap")))
})


