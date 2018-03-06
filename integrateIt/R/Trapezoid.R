#' A Trapezoid Rule Integration Object 
#' 
#' Object of class \code{Trapezoid} are created by the \code{integrateIt} and \code{print_It} functions
#'
#' 
#' An object of the class `Trapezoid' has the following slots:
#' \itemize{
#' \item \code{x} A vector of the x values of the input
#' \item \code{y} A vector of the y values of the input
#' \item \code{integral} The result of the function
#' }
#'
#' @author Alex Petri: \email{alexpetri@@wustl.edu}
#' @rdname Trapezoid
#' @export
setClass(Class="Trapezoid", 
     representation = representation(
          x = "numeric",
          y = "numeric",
          result = "numeric"
          ),
     prototype = prototype(
          x = c(),
          y = c(),
          result = c()
          )
     )

#' @export
setMethod("initialize", "Trapezoid", 
     function(.Object, ...){
           value=callNextMethod()
           return(value)
         }
         ) 

#' @export
setValidity("Trapezoid", function(object){ 
  if (!identical(length(object@x), length(object@y))){ #if user inputs x and y with different lengths (impossible to compute)
    return("The x and y arguments must have the same length")
  }
  else if (length(object@x) == 1){ #if there is only one data point (can't run the integration then!)
    return("x must have a length longer than 1 in order to perform the integration")
  }
}
)
