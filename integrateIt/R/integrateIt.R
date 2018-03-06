#' Integrating a set of x and y values using the Trapezoid or Simpsons Rule
#'
#' Integrates via Trapezoid or Simpsons Rule
#'
#' @param x A numeric object of x-axis values on a curve
#' @param y A numeric object with the same dimensionality as \code{x} and corresponding to the y-axis values on a curve
#' @param from Two numeric values: a - the minimum value of x, and b - the maximum value of x
#' @param Rule A character object: "Trap" to indicate desire to use the Trapezoid Rule and "Simpsons" for the Simpsons Rule
#'
#' @return An object of class Trapezoid or class Simpsons containing the class, the x and y vectors, and the result of the integration
#'  \item{object}{An object of class Trapezoid Simpson}
#' @author Alex Petri
#' @examples
#' 
#' 
#' integrateIt(x = c(1,2,3), y = c(1,4,9), from = c(1,3), Rule = "Trap")
#' 
#' 
#' @seealso \code{\link{print}}
#' @rdname integrateIt
#' @export
setGeneric(name="integrateIt",
           def=function(x, y, from, Rule)
           {standardGeneric("integrateIt")}
           )

#' @export
setMethod(f="integrateIt",
          definition = function(x, y, from, Rule){
            if (length(from) != 2){ #for if my from argument is fed more than two numbers
              return("from must be a vector of length two")
            }
            else if (Rule == "Trap"){ #if the user wants the Trapezoid rule
              h <- (max(x) - min(x))/(length(x)-1) #compute h
              resultTrap <- (h/2)*(y[1] + 2*(sum(y[-c(1, length(y))])) + y[length(y)]) #comput the result (sum the middle numbers and multiply by 2)
              output <- new("Trapezoid", x = x, y = y, result = resultTrap) #output new object of class
              return(output)
            } 
            else if (Rule == "Simpsons"){ #if they want Simpsons
              h <- (max(x) - min(x))/(length(x)-1) #compute h
              if(length(y) == 3){ #if the length of y is only 3 characters, enter this if statement
                resultSimp <- (h/3)*(y[1] + 4*(sum(y[seq(2, (length(y)-1), 2)])) + y[length(y)])
              } else { #if the length is more, use this one - doesn't work with three because of the way I structure sequence
                resultSimp <- (h/3)*(y[1] + 4*(sum(y[seq(2, (length(y)-1), 2)])) + 2*(sum(y[seq(3, (length(y)-1), 2)])) + y[length(y)])
              }
              output <- new("Simpsons", x = x, y = y, result = resultSimp) #new object of class
              return(output)
            } else {
              return("You must choose either'Simpsons' or 'Trap' for the Rule argument") #for if Rule argument is improper
            }
          }
          )

