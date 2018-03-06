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
#'  \item{x_and_y}{The vector of x and y values}
#'  \item{integral}{The computed integration}
#' @author Alex Petri
#' @examples
#' 
#' 
#' integrateIt(x = c(1,2,3), y = c(1,4,9), from = c(1,3), Rule = "Trap")
#' 
#' 
#' @seealso \code{\link{print_It}}
#' @rdname integrateIt
#' @export
setGeneric(name="integrateIt",
           def=function(x, y, from, Rule)
           {standardGeneric("integrateIt")}
           )

#' @export
setMethod(f="integrateIt",
          definition = function(x, y, from, Rule){
            if (length(from) != 2){
              return("from must be a vector of length two")
            }
            else if (from != c(min(x), max(x))){
              return("from must be a vector containing the maximum and minimum values of x")
            }
            else if (Rule == "Trap"){
              h <- (max(x) - min(x))/(length(x)-1)
              resultTrap <- (h/2)*(y[1] + 2*(sum(y[-c(1, length(y))])) + y[length(y)])
              object <- new("Trapezoid", x = x, y = y, result = resultTrap)
              x_and_y <- data.frame(x, y)
              return(list(object, x_and_y, resultTrap))
            } 
            else if (Rule == "Simpsons"){
              h <- (max(x) - min(x))/(length(x)-1)
              if(length(y) == 3){
                resultSimp <- (h/3)*(y[1] + 4*(sum(y[seq(2, (length(y)-1), 2)])) + y[length(y)])
              } else {
                resultSimp <- (h/3)*(y[1] + 4*(sum(y[seq(2, (length(y)-1), 2)])) + 2*(sum(y[seq(3, (length(y)-1), 2)])) + y[length(y)])
              }
              object <- new("Simpsons", x = x, y = y, result = resultSimp)
              x_and_y <- data.frame(x, y)
              return(list(object, x_and_y, resultSimp))
            } else {
              return("You must choose either'Simpsons' or 'Trap' for the Rule argument")
            }
          }
          )

