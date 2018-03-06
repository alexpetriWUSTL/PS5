#' A Simpson's Rule Integration Object 
#' 
#' Object of class \code{Simpsons} are created by the \code{integrateIt} and \code{print_It} functions
#'
#' 
#' An object of the class "Simpsons" has the following slots:
#' \itemize{
#' \item \code{x} A vector of the x values of the input
#' \item \code{y} A vector of the y values of the input
#' \item \code{integral} The result of the function
#' }
#'
#' @author Alex Petri: \email{alexpetri@@wustl.edu}
#' @rdname Simpsons
#' @export
setClass(Class="Simpsons", 
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
setMethod("initialize", "Simpsons", 
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          }
) 


#' @export
setValidity("Simpsons", function(object){ 
  if (!identical(length(object@x), length(object@y))){ #so the lengths aren't mismatched!
    return("The x and y arguments must have the same length")
  }
  #next we make sure simpsons has an odd number of y's
  else if (length(object@y %% 2) == 0){ 
    return("Simpson's rule is only valid for objects with y's of odd length")
  }
}
)
