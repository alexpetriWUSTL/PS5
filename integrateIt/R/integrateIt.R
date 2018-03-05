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
#' integrateIt(x = c(1,2,3), y = c(3,3,5), from = c(3,1), Rule = "Trapezoid")
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
            if (Rule == "Trap"){
              h <- (max(x) - min(x))/(length(x)-1)
              trapezoid <- (h/2)*(y[1] + 2*(sum(y[-c(1, length(y))])) + y[length(y)])
              return(new("Trapezoid", trapezoid, x = x, y = y))
            } 
            else if (Rule == "Simpsons"){
              h <- (max(x) - min(x))/(length(x)-1)
              simpsons <- (h/3)*(y[1] + 4*(sum(y[seq(2, (length(y)-1), 2)])) + 2*(sum(y[seq(3, (length(y)-1), 2)])) + y[length(y)])
              return(new("Simpsons", simpsons, x = x, y = y))
            }
          }
          )


