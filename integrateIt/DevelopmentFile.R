
## Load libraries and set working directory
library(devtools)
library(roxygen2)
setwd("C:/Users/Alex Petri/Downloads/GithubASP/PS5/integrateIt") #This will need to be changed to match your directory




# Now the NAMESPACE

## This can be run many times as the code is updates
current.code <- as.package("integrateIt")
load_all(current.code)
document(current.code)

## Let's look at a function
getSquares
getMethod(getSquares, "Squares")
getMethod(getSquares, "AllSquares")
getMethod(allSquares)

## Let's try it out
x<-c(1,2)
y<-c(3,4)
allObj <- allSquares(x, y)
allObj
getSquares(allObj)

## Moving between classes
addObj <- addSquares(x,y)
as(object=addObj, Class="AllSquares")



