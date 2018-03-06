#' Printing the Simpsons or Trapezoid Integration in the integrateIt function
#'
#' This function prints out the result of integrateIt
#'
#' @param x The object of class "Trapezoid" or "Simpsons" at the returned result from the integrateIt function
#'
#' @author Alex Petri
#' @examples
#' 
#' result <- integrateIt(x = c(1,2,3), y = c(1,4,9), from = c(1,3), Rule = "Trapezoid")
#' print(result)
#' 
#' 
#' @seealso \code{\link{integrateIt}}
#' @rdname print_It
#' @export
setMethod(f="print", "Simpsons", #a print method for simpsons
          definition=function(x){
            paste(as.character(x@result))
          }
          )

#' @export
setMethod(f="print", "Trapezoid", #a print method for trap
          definition=function(x){
            paste(as.character(x@result))
          }
)


