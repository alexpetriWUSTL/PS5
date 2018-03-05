#' Printing the Simpsons or Trapezoid Integration in the integrateIt function
#'
#' This function prints out the result of integrateIt
#'
#' @param x A numeric object
#'
#' @return A list with the elements
#'  \item{squares}{The difference of the squared values}
#'  \item{x}{The first object input} 
#'  \item{y}{The second object input}
#' @author Alex Petri
#' @examples
#' 
#' myX <- c(20, 3) 
#' myY <- c(-2, 4.1) 
#' subtractSquares(myX, myY)
#' @seealso \code{\link{integrateIt}}
#' @rdname print_It
#' @export
setGeneric(name="print_It",
           def=function(x,...)
           {standardGeneric("")}
           )

#' @export
setMethod(f="print_It",
          definition=function(x,...){
            print())
          }
          )




